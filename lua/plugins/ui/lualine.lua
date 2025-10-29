return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
	config = function()
		local lazy_status = require("lazy.status")
		local catppuccin = require("config.highlights.lualine")
		local navic = require("nvim-navic")

		require("lualine").setup({
			options = {
				disabled_filetypes = {
					"alpha",
					"toggleterm",
					winbar = {
						"NvimTree",
						"toggleterm",
						"dap-repl",
						"dapui_scopes",
						"dapui_breakpoints",
						"dapui_stacks",
						"dapui_watches",
						"dapui_console",
					},
				},
				globalstatus = false,
				icons_enabled = true,
				ignore_focus = {
					"NvimTree",
					"toggleterm",
					"dap-repl",
					"dapui_scopes",
					"dapui_breakpoints",
					"dapui_stacks",
					"dapui_watches",
					"dapui_console",
				},
				theme = catppuccin,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},

			winbar = {
				lualine_a = {},
				lualine_b = {
					{
						function()
							return "󱞫"
						end,
						color = {
							fg = "#a19283",
							bg = "#1e1e1e",
						},
					},
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available()
						end,

						color = {
							fg = "#a19283",
							bg = "#1e1e1e",
						},
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},

			inactive_winbar = {
				lualine_a = {
					{
						function()
							return "󱞫"
						end,
						color = {
							fg = "#a19283",
							bg = "#1e1e1e",
						},
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{

						function()
							local msg = "No Active Lsp"
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return client.name
								end
							end
							return msg
						end,

						icon = " LSP:",
					},
					{
						function()
							return require("dap").status()
						end,
						icon = { "", color = { fg = "#e7c664" } },
						cond = function()
							if not package.loaded.dap then
								return false
							end
							local session = require("dap").session()
							return session ~= nil
						end,
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					"filetype",
				},
				lualine_z = { "location" },
			},

			inactive_sections = {
				lualine_a = { { "filename", color = {
					bg = "#a19283",
					fg = "#1e1e1e",
				} } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "nvim-tree", "toggleterm" },
		})
	end,
}
