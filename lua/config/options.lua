local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------

-- indenting options
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- search options
o.ignorecase = true
o.smartcase = true

-- windows options
o.splitkeep = "screen"
o.splitbelow = true
o.splitright = true

-- numbers options
opt.number = true
opt.relativenumber = true
o.numberwidth = 2

-- status line options
o.laststatus = 3
o.showmode = false
o.ruler = false

-- enable mouse in all modes
o.mouse = "a"

-- new icons for folders
o.fillchars = "foldopen:,foldclose:,foldsep: "

-- set status column visible
opt.signcolumn = "yes"

-- set timeframe for incomplete keymappings
o.timeoutlen = 400

-- yank and put to another applications
o.clipboard = "unnamedplus"

-- enable true colors
opt.termguicolors = true

-- cursor highlight
o.cursorline = true

-- blink cursor
vim.opt.guicursor = {
	"a:blinkon400-blinkoff250",
	"n-v-c:block",
	"i-ci:ver25",
	"r:hor20",
}

-- determine what is save in sessions
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- disable nvim intro
opt.shortmess:append("sI")

-- allow undo in buffers on freshly open Neovim
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
