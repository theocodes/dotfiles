local utils = require("utils")
local set_highlight = utils.set_highlight
local get_highlight = utils.get_highlight
local pp = utils.pp

-- Theme setup
vim.g.adwaita_darker = true -- for darker version
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
-- set_highlight("Whitespace", { bg = "#222421" })

set_highlight("MsgArea", { bg = "NONE" })

set_highlight("IndentBlanklineIndent1", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent2", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent3", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent4", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent5", { fg = "#1f1f1e", bg = "NONE" })

-- #E06C75
-- #E5C07B
-- #98C379
-- #56B6C2
-- #61AFEF
-- #C678DD
