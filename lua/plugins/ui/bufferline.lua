return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	event = "VeryLazy",
	config = function()
		local bufferline_hl = require("config.highlights.bufferline")
		require("bufferline").setup({
			highlights = require("catppuccin.special.bufferline").get_theme(bufferline_hl),
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				close_command = "BufDel %d",
				right_mouse_command = "BufDel %d",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
					{
						filetype = "dapui_scopes",
						separator = true,
					},
				},
				indicator = {
					style = "icon",
					icon = "▌",
				},
			},
		})
	end,
}
