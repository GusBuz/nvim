return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			lsp = {
				enabled = true,
			},

			dev_tools = {
				autostart = true,
				auto_open_browser = true,
			},

			widget_guides = {
				enabled = true,
			},
		})
	end,
}
