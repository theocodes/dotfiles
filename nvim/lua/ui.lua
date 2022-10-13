local utils = require("utils")
local set_highlight = utils.set_highlight
local get_highlight = utils.get_highlight

-- Theme setup
vim.g.adwaita_darker = true -- for darker version
vim.g.adwaita_disable_cursorline = true -- disable cursorline
vim.cmd([[colorscheme adwaita]])

-- Highlight overrides
local primary = get_highlight("String")
set_highlight("FloatBorder", { bg = "NONE", fg = "White" })

local cursor_bg = get_highlight("CursorLineNr").background
set_highlight("CursorLineNr", { fg = primary.foreground, bg = cursor_bg })

set_highlight("GitSignsAdd", { bg = "NONE", fg = "#6ffc03" })
set_highlight("GitSignsDelete", { bg = "NONE", fg = "Red" })
set_highlight("GitSignsChange", { bg = "NONE", fg = "Yellow" })

set_highlight("ExtraWhitespace", { bg = "Red" })
set_highlight("MsgArea", { bg = "NONE" })
set_highlight("NormalFloat", { bg = "NONE" })

