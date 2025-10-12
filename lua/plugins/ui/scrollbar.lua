return {
	"petertriho/nvim-scrollbar",
	config = function()
		require("scrollbar").setup({
			marks = {
				Search = {
					text = { "▫", "▪" },
				},
				Error = {
					text = { "▫", "▪" },
				},
				Warn = {
					text = { "▫", "▪" },
				},
				Info = {
					text = { "▫", "▪" },
				},
				Hint = {
					text = { "▫", "▪" },
				},
				Misc = {
					text = { "▫", "▪" },
				},
			},
			handlers = {
				cursor = false,
				gitsigns = true,
			},
		})
	end,
}
