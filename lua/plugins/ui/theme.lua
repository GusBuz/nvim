return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				auto_integrations = true,
				integrations = {
					noice = true,
					notify = true,
				},
				color_overrides = {
					mocha = {
						rosewater = "#ffc9c9",
						flamingo = "#ff9f9a",
						pink = "#ffa9c9",
						mauve = "#df95cf",
						lavender = "#a990c9",
						red = "#ff6960",
						maroon = "#f98080",
						peach = "#f9905f",
						yellow = "#f9bd69",
						green = "#b0d080",
						teal = "#a0dfa0",
						sky = "#a0d0c0",
						sapphire = "#95b9d0",
						blue = "#89a0e0",
						text = "#e0d0b0",
						subtext1 = "#e3d1b7",
						subtext0 = "#c8b9a1",
						overlay2 = "#a19283",
						overlay1 = "#8b7d72",
						overlay0 = "#756961",
						surface2 = "#5a524e",
						surface1 = "#464240",
						surface0 = "#313131",
						base = "#212121",
						mantle = "#1a1a1a",
						crust = "#141414",
					},
				},
				highlight_overrides = {
					mocha = function(mocha)
						return {
							Comment = { fg = mocha.overlay0 },
							["@type.tag.css"] = { fg = mocha.sky },
							StatusLine = { bg = mocha.base },
							StatusLineNC = { bg = mocha.base },
							DiagnosticVirtualTextOk = { bg = "" },
							DiagnosticVirtualTextHint = { bg = "" },
							DiagnosticVirtualTextInfo = { bg = "" },
							DiagnosticVirtualTextWarn = { bg = "" },
							DiagnosticVirtualTextError = { bg = "" },
						}
					end,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
