return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "GusBuz/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})
		-- vim.lsp.config("cssls", require("config.lsp.cssls"))
		-- vim.lsp.config("emmet_ls", require("config.lsp.emmet_ls"))
		-- vim.lsp.config("eslint", require("config.lsp.eslint"))
		-- vim.lsp.config("html", require("config.lsp.html"))
		vim.lsp.config("lua_ls", require("config.lsp.lua_ls"))
		-- vim.lsp.config("ts_ls", require("config.lsp.ts_ls"))
		vim.lsp.config("jsonls", require("config.lsp.jsonls"))
		-- vim.lsp.config("dartls", require("config.lsp.dartls"))
		-- vim.lsp.config("basedpyright", require("config.lsp.basedpyright"))
		vim.lsp.config("kotlin_lsp", require("config.lsp.kotlin_lsp"))

		vim.diagnostic.config({
			-- virtual_lines = true,
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
			},
			signs = {
				text = {

					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = " ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarningMsg",
				},
			},
		})
	end,
}
