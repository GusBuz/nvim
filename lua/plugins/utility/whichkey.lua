return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	cmd = "WhichKey",

	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>D", desc = "LSP file diagnostics" },
			{ "<leader>d", desc = "LSP line diagnostics" },
			{ "<leader>l", desc = "LSP commands", icon = { icon = "", color = "green" } },
			{ "<leader>f", desc = "Telescope", icon = { icon = "", color = "grey" } },
			{ "<leader>x", desc = "Trouble", icon = { icon = "", color = "yellow" } },
			{ "<leader>g", desc = "LazyGit", icon = { icon = "", color = "orange" } },
			{ "<leader>w", desc = "Sessions", icon = { icon = "", color = "cyan" } },
			{ "<leader>m", desc = "Multicursor", icon = { icon = "󰇀" } },
			{ "<leader>/", desc = "Toggle comment" },
			{ "<leader>n", desc = "Toggle numbers" },
			{ "<leader>F", desc = "Flutter Tools", icon = { icon = "", color = "azure" } },
			{ "<leader>q", "<cmd>qa<cr>", desc = "Save & Quit" },

			{ "<leader><up>", hidden = true },
			{ "<leader><down>", hidden = true },
			{ "<leader>e", hidden = true },
		})
		require("which-key").setup({
			layout = {
				width = { min = 35 },
				spacing = 5,
			},

			sort = { "manual" },
		})
	end,
}
