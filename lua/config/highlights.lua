local hl = vim.api.nvim_set_hl

-- -- status column
-- hl(0, "FoldColumn", { bg = "" })
-- hl(0, "SignColumn", { bg = "" })
-- hl(0, "ErrorMsg", { bg = "" })
-- hl(0, "DiagnosticSignError", { bg = "" })
-- hl(0, "DiagnosticSignWarn", { bg = "" })
-- hl(0, "DiagnosticSignInfo", { bg = "" })
-- hl(0, "DiagnosticSignHint", { bg = "" })
--
-- -- virtual text
-- hl(0, "DiagnosticVirtualTextOk", { bg = "" })
-- hl(0, "DiagnosticVirtualTextHint", { bg = "" })
-- hl(0, "DiagnosticVirtualTextInfo", { bg = "" })
-- hl(0, "DiagnosticVirtualTextWarn", { bg = "" })
-- hl(0, "DiagnosticVirtualTextError", { bg = "" })

-- multicursor
hl(0, "MultiCursorCursor", { link = "Cursor" })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

-- separators
hl(0, "WinSeparator", { link = "Separator" })
hl(0, "BufferLineSeparator", { link = "Separator" })
hl(0, "BufferLineSeparatorVisible", { link = "Separator" })
hl(0, "BufferLineSeparatorSelected", { link = "Separator" })
hl(0, "NvimTreeStatusLineNc", { fg = "", bg = "" })

-- debugger
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f98080" })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#f9bd69" })
vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#a990c9" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#b0d080" })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#ffa9c9" })
vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2d3a3a" })
