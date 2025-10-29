return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("mason-nvim-dap").setup({
			automatic_setup = true,
			automatic_installation = true,
			ensure_installed = {
                -- "dart",
				-- "python",
                -- "debugpy",
				-- "js-debug-adapter",
			},
			handlers = {},
		})
	end,
}
