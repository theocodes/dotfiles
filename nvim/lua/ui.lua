local utils = require("utils")
local set_highlight = utils.set_highlight
local get_highlight = utils.get_highlight
local pp = utils.pp

-- Theme setup
vim.g.adwaita_darker = true -- for darker version
vim.g.adwaita_disable_cursorline = false -- to disable cursorline
vim.cmd([[colorscheme adwaita]])

-- Highlight overrides
local primary = get_highlight("String")

set_highlight("FloatBorder", { bg = "NONE", fg = "White" })

local cursor_bg = get_highlight("CursorLineNr").background
set_highlight("CursorLineNr", { fg = primary.foreground, bg = cursor_bg })

