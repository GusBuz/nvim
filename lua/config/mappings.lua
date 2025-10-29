local map = vim.keymap.set

-- general mappings
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Quit insert mode" })

-- insert mode movement
map("i", "<C-b>", "<ESC>^i", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- window movement
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- status column's number
map("n", "<leader>nl", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- plugins mapping ---------------------------------------------------------------

-- autosession
map("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
map("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session root dir" })
map("n", "<leader>wa", "<cmd>AutoSession toggle<CR>", { desc = "Toggle autosave" })
map("n", "<leader>wf", "<cmd>AutoSession search<CR>", { desc = "Session search" })

-- bufdel
map("n", "<leader>c", "<cmd>BufDel<CR>", { desc = "Delete buffer" })

-- bufferline
map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- comment
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- conform format
map({ "n", "v" }, "<leader>mp", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 2500,
	})
end, { desc = "Format file or range (in visual mode)" })

-- flash
local flash = require("flash")
map({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
	flash.remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Treesitter Search" })
map({ "c" }, "<C-s>", function()
	flash.toggle()
end, { desc = "Toggle Flash Search" })

-- flutter tools
-- map("n", "<leader>FS", ":FlutterRun<CR>", { desc = "Flutter Run" })
-- map("n", "<leader>FR", ":FlutterRestart<CR>", { desc = "Flutter Hot Restart" })
-- map("n", "<leader>FQ", ":FlutterQuit<CR>", { desc = "Flutter Quit" })

-- lazygit
map({ "n", "v" }, "<leader>g", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })

-- maximizer
map({ "n", "v" }, "M", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- multicursor
local mc = require("multicursor-nvim")
map({ "n", "x" }, "<up>", function()
	mc.lineAddCursor(-1)
end, { desc = "Add cursor above" })
map({ "n", "x" }, "<down>", function()
	mc.lineAddCursor(1)
end, { desc = "Add cursor below" })
map({ "n", "x" }, "<leader><up>", function()
	mc.lineSkipCursor(-1)
end, { desc = "Skip cursor above" })
map({ "n", "x" }, "<leader><down>", function()
	mc.lineSkipCursor(1)
end, { desc = "Skip cursor below" })

map({ "n", "x" }, "<leader>ma", function()
	mc.matchAddCursor(1)
end, { desc = "Add cursor in next match" })
map({ "n", "x" }, "<leader>ms", function()
	mc.matchSkipCursor(1)
end, { desc = "Skip cursor in next match" })
map({ "n", "x" }, "<leader>mA", function()
	mc.matchAddCursor(-1)
end, { desc = "Add cursor in previous match" })
map({ "n", "x" }, "<leader>mS", function()
	mc.matchSkipCursor(-1)
end, { desc = "Skip cursor in previous match" })

map("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add/remove cursor at mouse click" })
map("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Add cursor at mouse dragging" })
map("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Finish the cursor selection" })

map({ "n", "x" }, "<C-q>", mc.toggleCursor, { desc = "Disable/enable cursor" })

mc.addKeymapLayer(function(layerSet)
	layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "Select previous cursor as the main" })
	layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "Select next cursor as the main" })
	layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor, { desc = "Delete the main cursor" })
	layerSet("n", "<esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end, { desc = "Enable and clear cursor" })
end)

-- nvim-dap
local dap = require("dap")
local dapui = require("dapui")
local dapui_widgets = require("dap.ui.widgets")

map("n", "<F6>", dap.continue, { desc = "Debug: Continue/Start" })
map("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

map("n", "<Leader>dd", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<Leader>dD", dap.set_breakpoint, { desc = "Debug: Set Conditional Breakpoint" })
map("n", "<Leader>dbl", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Debug: Set Log Point" })
map("n", "<Leader>dbc", dap.clear_breakpoints, { desc = "Debug: Clear All Breakpoints" })

map("n", "<Leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
map("n", "<Leader>dl", dap.run_last, { desc = "Debug: Run Last Configuration" })
map("n", "<Leader>dq", function()
	dap.terminate()
	dapui.close()
end, { desc = "Debug: Terminate Session & Close UI" })

map({ "n", "v" }, "<Leader>dh", dapui_widgets.hover, { desc = "Debug: Hover Variables" })
map({ "n", "v" }, "<Leader>dp", dapui_widgets.preview, { desc = "Debug: Preview Expression" })
map("n", "<Leader>df", function()
	dapui_widgets.centered_float(dapui_widgets.frames)
end, { desc = "Debug: Show Call Stack" })
map("n", "<Leader>ds", function()
	dapui_widgets.centered_float(dapui_widgets.scopes)
end, { desc = "Debug: Show Scopes" })
map("n", "<Esc>", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, true)
		end
	end
end, { desc = "Close Floating Windows" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree Toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "NvimTree Focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" })
map("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" })
map("n", "<leader>fgt", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Telescope find all files" }
)

-- terminal
map("t", "<ESC>", "<C-\\><C-N>", { desc = "Escape terminal mode" })
map("n", "<C-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", { desc = "Toggle Terminal" })
map("i", "<C-t>", "<Esc>" .. "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", { desc = "Toggle Terminal" })

-- trouble
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open trouble workspace diagnostics" })
map(
	"n",
	"<leader>xd",
	"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Open trouble document diagnostics" }
)
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble location list" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })

-- whichkey
map("n", "<leader>ka", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })
map("n", "<leader>kq", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "Whichkey query lookup" })
