return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"luadoc",
				"printf",
				"vim",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"regex",
				"bash",
                "python"
			},

			highlight = {
				enable = true,
				use_languagetree = true,
			},

			indent = { enable = true },
		})
	end,
}
