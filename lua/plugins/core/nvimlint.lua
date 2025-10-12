return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local linters = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			css = { "stylelint" },
			html = { "htmlhint" },
			-- lua = { "selene" },
		}
		require("lint").linters_by_ft = linters
	end,
}
