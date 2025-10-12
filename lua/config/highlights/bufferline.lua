local mocha = require("catppuccin.palettes").get_palette("mocha")

return {
	custom = {
		mocha = {
			-- Buffers
			buffer_selected = { bg = mocha.surface0 },
			-- Duplicate
			duplicate_selected = { bg = mocha.surface0 },
			-- Tabs
			tab_selected = { fg = mocha.text },
			-- Indicator
			indicator_visible = { fg = mocha.text },
			indicator_selected = { fg = mocha.text, bg = mocha.surface0 },
			-- Close button
			close_button_selected = { bg = mocha.surface0 },
			-- Empty fill
			fill = { bg = mocha.base },
			-- Numbers
			numbers_selected = { bg = mocha.surface0 },
			-- Errors
			error_selected = { bg = mocha.surface0 },
			error_diagnostic_selected = { bg = mocha.surface0 },
			-- Warnings
			warning_selected = { bg = mocha.surface0 },
			warning_diagnostic_selected = { bg = mocha.surface0 },
			-- Infos
			info_selected = { bg = mocha.surface0 },
			info_diagnostic_selected = { bg = mocha.surface0 },
			-- Hint
			hint_selected = { bg = mocha.surface0 },
			hint_diagnostic_selected = { bg = mocha.surface0 },
			-- Diagnostics
			diagnostic_selected = { bg = mocha.surface0 },
			-- Modified
			modified_selected = { bg = mocha.surface0 },
		},
	},
}
