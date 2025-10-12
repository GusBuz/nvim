return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"BurntSushi/ripgrep",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "%.git/", "node_modules", "target" },
				hidden = true,
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
			},
			extensions = {
				file_icons = {},
			},
		})
	end,
}
