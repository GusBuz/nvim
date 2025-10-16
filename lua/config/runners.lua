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

	local runners = {
		python = function()
			local file_path = vim.fn.shellescape(vim.fn.expand("%:p"))
			run_command("python " .. file_path)
		end,

		java = function()
			local file_path = vim.fn.shellescape(vim.fn.expand("%:p"))
			local file_root = vim.fn.shellescape(vim.fn.expand("%:r"))
			run_command("javac " .. file_path + " && java " .. file_root)
		end,

		javascript = function()
			local file_path = vim.fn.shellescape(vim.fn.expand("%:p"))
			run_command("node " .. file_path)
		end,

		lua = function()
			local file_path = vim.fn.shellescape(vim.fn.expand("%:p"))
			run_command("lua " .. file_path)
		end,

		sh = function()
			local file_path = vim.fn.shellescape(vim.fn.expand("%:p"))
			run_command("bash " .. file_path)
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
