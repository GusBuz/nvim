return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = false,
			ensure_installed = {
				-- "ts_ls",
				-- "html",
				-- "cssls",
				"lua_ls",
				-- "emmet_ls",
				-- "eslint",
                "jsonls",
                -- "basedpyright"
                "kotlin_lsp",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
                -- Formatters & Linters
				"prettier",
				"stylua",
				-- "eslint_d",
				-- "ruff",
                -- "ktlint",

				-- Debuggers (DAP)
				-- "debugpy",
				-- "js-debug-adapter",
			},
		})
	end,
}
