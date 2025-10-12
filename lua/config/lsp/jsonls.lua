return {
	filetypes = { "json", "jsonc" },
	init_options = {
		provideFormatter = true,
	},
	settings = {
		json = {
			jsonc = { enable = true },
			format = {
				enable = true,
				insertSpaces = true,
				tabSize = 2,
			},
		},
	},
}
