return {
	filetypes = { "html", "svelte", "vue", "typescriptreact", "javascriptreact" },
	settings = {
		html = {
			suggest = { html5 = true },
			completion = {
				attributeDefaultValue = "empty",
			},
		},
	},
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
}
