return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"brenoprata10/nvim-highlight-colors",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			auto_select = true,
			completion = {
				completeopt = "menu,menuone,preview,noselect",
				-- keyword_length = 200,
				-- trigger_characters = {},
			},
			window = {
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					scrollbar = "║",
					winhighlight = "Normal:CmpDocBody,FloatBorder:CmpDocBorder,CursorLine:PMenuSel,Search:None",
				},
				completion = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					scrollbar = "║",
					winhighlight = "Normal:CmpDocBody,FloatBorder:CmpDocBorder,CursorLine:PMenuSel,Search:None",
				},
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					priority = 1000,
					entry_filter = function(entry)
						return not (entry:get_kind() == cmp.lsp.CompletionItemKind.Snippet)
					end,
				},
				{ name = "luasnip", priority = 900 },
				{ name = "nvim_lua", priority = 850 },
				{ name = "buffer", priority = 500 },
				{ name = "path", priority = 400 },
				{ name = "calc", priority = 300 },
				{ name = "emoji", priority = 200 },
			}),

			formatting = {
				format = function(entry, item)
					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
					item = lspkind.cmp_format({
						-- mode = "symbol_text",
						-- menu = {
						-- 	buffer = "buffer",
						-- 	nvim_lsp = "LSP",
						-- 	luasnip = "snippet",
						-- 	path = "path",
						-- },
						maxwidth = {
							menu = function()
								return math.floor(0.5 * vim.o.columns)
							end,
						},
						ellipsis_char = "...",
						show_labelDetails = true,

						before = function(entry, vim_item)
							-- ...
							return vim_item
						end,
					})(entry, item)
					if color_item.abbr_hl_group then
						item.kind_hl_group = color_item.abbr_hl_group
						item.kind = color_item.abbr
					end
					return item
				end,
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})
	end,
}
