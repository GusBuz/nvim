return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
		"vue",
	},
	settings = {
		workingDirectory = {
			mode = "auto",
		},
	},
	on_attach = function(client, bufnr)
		if not vim.lsp.config.eslint.on_attach then
			return
		end

		vim.lsp.config.eslint.on_attach(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "LspEslintFixAll",
		})
	end,
}
