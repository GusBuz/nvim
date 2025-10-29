return {
	"luukvbaal/statuscol.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldenable = true
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.o.foldlevel = 999
		vim.o.statuscolumn = "%s"

		local builtin = require("statuscol.builtin")

		require("statuscol").setup({
			relculright = true,

			segments = {
				{
					sign = { namespace = { "diagnostic" }, maxwidth = 2, auto = true },
					click = "v:lua.ScSa",
				},
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				{
					sign = { namespace = { "gitsigns" }, maxwidth = 2, auto = true },
					click = "v:lua.ScSa",
				},
				{
					sign = {
						name = {
							"DapBreakpoint",
							"DapLogPoint",
							"DapStopped",
							"DapStepInto",
							"DapStepOver",
							"DapStepOut",
						},
						maxwidth = 2,
						colwidth = 1,
						auto = true,
						wrap = true,
					},

					click = "v:lua.ScSa",
				},
				{ text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
			},
		})
	end,
}
