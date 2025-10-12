local get_catppuccin = require("catppuccin.utils.lualine")
local catppuccin = get_catppuccin("mocha")
local mocha = require("catppuccin.palettes").get_palette("mocha")

catppuccin.inactive.a.bg = mocha.base
catppuccin.inactive.a.fg = mocha.text
catppuccin.inactive.b.bg = mocha.base
catppuccin.inactive.b.fg = mocha.text
catppuccin.inactive.c.bg = mocha.base
catppuccin.inactive.c.fg = mocha.text

catppuccin.normal.a.bg = mocha.text
catppuccin.normal.a.fg = mocha.mantle
catppuccin.normal.b.bg = mocha.surface1
catppuccin.normal.b.fg = mocha.text
catppuccin.normal.c.bg = mocha.surface0
catppuccin.normal.c.fg = mocha.text

catppuccin.insert.a.bg = mocha.yellow
catppuccin.insert.a.fg = mocha.mantle
catppuccin.insert.b.bg = mocha.surface1
catppuccin.insert.b.fg = mocha.text

catppuccin.visual.a.bg = mocha.lavender
catppuccin.visual.a.fg = mocha.mantle
catppuccin.visual.b.bg = mocha.surface1
catppuccin.visual.b.fg = mocha.text

catppuccin.replace.a.bg = mocha.red
catppuccin.replace.a.fg = mocha.mantle
catppuccin.replace.b.bg = mocha.surface1
catppuccin.replace.b.fg = mocha.text

catppuccin.command.a.bg = mocha.green
catppuccin.command.a.fg = mocha.mantle
catppuccin.command.b.bg = mocha.surface1
catppuccin.command.b.fg = mocha.text

catppuccin.terminal.a.bg = mocha.sky
catppuccin.terminal.a.fg = mocha.mantle
catppuccin.terminal.b.bg = mocha.surface1
catppuccin.terminal.b.fg = mocha.text

return catppuccin
