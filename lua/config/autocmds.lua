local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local general = augroup("General", { clear = true })

-- autocmd for mfussenegger/nvim-lint
autocmd({ "BufWritePost" }, {
	pattern = "*.js,*.jsx,*.css,*.html,*.lua",

	callback = function()
		require("lint").try_lint()
	end,
	group = general,
	desc = "Auto execute lints",
})

-- removes trailing whitespace on save
autocmd("BufWritePre", {
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
	group = general,
	desc = "Remove whitespaces on save",
})

-- highlights yanked text
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 150,
		})
	end,
	group = general,
	desc = "Short highlight yanked text",
})

-- autosave
autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
	-- nested = true, -- for format on save
	callback = function()
		if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! w")
		end
	end,
	group = general,
	desc = "Auto Save",
})

-- LSP Attach
autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
		map("<leader>d", vim.diagnostic.open_float, "Open Diagnostic Float")
		map("K", vim.lsp.buf.hover, "Hover Documentation")

		map("<leader>le", vim.lsp.buf.declaration, "Goto Declaration")
		map("<leader>lf", "<cmd>Telescope lsp_references<CR>", "Show references")
		map("<leader>ld", "<cmd>Telescope lsp_definitions<CR>", "Show definitions")
		map("<leader>li", "<cmd>Telescope lsp_implementations<CR>", "Show implementations")
		map("<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", "Show type definitions")
		map("<leader>ls", vim.lsp.buf.signature_help, "Signature Documentation")
		map("<leader>la", vim.lsp.buf.code_action, "Code Action")
		map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
		map("<leader>l<F5>", ":LspRestart<CR>", "Restart LSP")

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local navic = require("nvim-navic")
		local navbuddy = require("nvim-navbuddy")

		if client and client_supports_method(client, "textDocument/documentSymbol", event.buf) then
			navic.attach(client, event.buf)
			navbuddy.attach(client, event.buf)
		end

		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			-- When cursor stops moving: Highlights all instances of the symbol under the cursor
			-- When cursor moves: Clears the highlighting
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			-- When LSP detaches: Clears the highlighting
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
