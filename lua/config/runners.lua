local M = {}

function M.setup_runners()
	local Term = require("toggleterm.terminal").Terminal
	local runner = Term:new({
		cmd = "bash",
		direction = "horizontal",
		hidden = true,
		count = 100,
	})

	local function run_command(cmd)
		if not runner:is_open() then
			runner:open()
			vim.defer_fn(function()
				runner:send(cmd, false)
			end, 100)
		else
			runner:send(cmd, false)
		end
	end

	local function get_file_vars()
		local expand = vim.fn.expand

		return {
			path = expand("%:p"), -- /home/user/file.kt
			name = expand("%:t"), -- file.kt
			name_no_ext = expand("%:t:r"), -- file
			root = expand("%:r"), -- /home/user/file
			dir = expand("%:p:h"), -- /home/user
			ext = expand("%:e"), -- kt
		}
	end

	local function simple_runner(cmd_template)
		return function()
			local vars = get_file_vars()
			local cmd = cmd_template:gsub("${(%w+)}", function(key)
				return vars[key] or ("${" .. key .. "}")
			end)
			run_command(cmd)
		end
	end

	local function get_relative_build_dir(file_path)
		local current_dir = vim.fn.getcwd()
		local relative_path = file_path:gsub("^" .. current_dir .. "/", ""):gsub("%.kt$", ""):gsub("%.java$", "")
		local dir_path = relative_path:match("(.+)/[^/]*$") or ""
		dir_path = dir_path:gsub("^src/", "")
		return dir_path
	end

	local runners = {
		python = simple_runner("python ${path}"),
		javascript = simple_runner("node ${path}"),
		lua = simple_runner("lua ${path}"),
		sh = simple_runner("bash ${path}"),

		java = function()
			local vars = get_file_vars()
			local build_dir = "build"
			local relative_build_dir = get_relative_build_dir(vars.path)
			local build_subdir = build_dir .. "/" .. (relative_build_dir ~= "" and relative_build_dir or ".")

			run_command(
				"mkdir -p '"
					.. build_subdir
					.. "' && "
					.. "javac '"
					.. vars.path
					.. "' -d '"
					.. build_subdir
					.. "' && "
					.. "java -cp '"
					.. build_subdir
					.. "' "
					.. vars.name_no_ext
			)
		end,

		kotlin = function()
			local vars = get_file_vars()
			local build_dir = "build"
			local relative_build_dir = get_relative_build_dir(vars.path)
			local build_subdir = build_dir .. "/" .. (relative_build_dir ~= "" and relative_build_dir or ".")
			local jar_path = build_subdir .. "/" .. vars.name_no_ext .. ".jar"

			run_command(
				"mkdir -p '"
					.. build_subdir
					.. "' && "
					.. "kotlinc '"
					.. vars.path
					.. "' -include-runtime -d '"
					.. jar_path
					.. "' && "
					.. "java -jar '"
					.. jar_path
					.. "'"
			)
		end,
	}

	for filetype, runner_func in pairs(runners) do
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetype,
			callback = function()
				vim.keymap.set("n", "<F5>", function()
					vim.cmd("w")
					runner_func()
				end, { buffer = true, desc = "Run " .. filetype:upper() })
			end,
		})
	end
end

return M
