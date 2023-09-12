local hi = require("utils").hi

-- local lush = require("lush")
-- local hsl = lush.hsl
--
-- colors:
--   primary:
--     background: '#000000'
--     foreground: '#FFFFFF'
--
--   # Normal Colours
--   normal:
--     black:   '#1a1a1a'
--     red:     '#f4005f'
--     green:   '#98e024'
--     yellow:  '#fa8419'
--     blue:    '#9d65ff'
--     magenta: '#f4005f'
--     cyan:    '#58d1eb'
--     white:   '#c4c5b5'
--
--   # Bright Colours
--   bright:
--     black:   '#625e4c'
--     red:     '#f4005f'
--     green:   '#98e024'
--     yellow:  '#e0d561'
--     blue:    '#9d65ff'
--     magenta: '#f4005f'
--     cyan:    '#58d1eb'
--     white:   '#f6f6ef'

-- local background = hsl("#000000")
-- local foreground = hsl("#FFFFFF")
--
-- local black = hsl("#1a1a1a")
-- local red = hsl("#f4005f")
-- local green = hsl("#98e024")
-- local yellow = hsl("#fa8419")
-- local blue = hsl("#9d65ff")
-- local magenta = hsl("#f4005f")
-- local cyan = hsl("#58d1eb")
-- local white = hsl("#c4c5b5")
-- --
-- local black_bright = hsl("#625e4c")
-- local red_bright = hsl("#f4005f")
-- local green_bright = hsl("#98e024")
-- local yellow_bright = hsl("#e0d561")
-- local blue_bright = hsl("#9d65ff")
-- local magenta_bright = hsl("#f4005f")
-- local cyan_bright = hsl("#58d1eb")
-- local white_bright = hsl("#f6f6ef")
--
-- return lush(function()
--   return {
--     Normal { bg = background },
--     NormalFloat { bg = background },
--
--     LineNr { bg = background },
--     SignColumn { bg = background },
--
--     Cursor { style = "reverse" },
--     CursorLine { bg = black },
--
--     StatusLine { bg = background },
--
--     DiffAdd { bg = green_bright, fg = green_bright },
--     DiffChange { bg = yellow, fg = yellow },
--     DiffDelete { bg = red, fg = red },
--
--     Visual { bg = black },
--
--     DiagnosticWarn { bg = background, fg = yellow_bright },
--     DiagnosticError { bg = background, fg = red_bright },
--
--     NonText { fg = white },
--   }
-- end)

-- set colorscheme
-- vim.g.moonflyItalics = false
-- vim.g.moonflyTransparent = true
-- vim.g.moonflyNormalFloat = false
-- vim.cmd.colorscheme "moonfly"

vim.g.adwaita_darker = true -- for darker version
vim.g.adwaita_disable_cursorline = true -- to disable cursorline
vim.g.adwaita_transparent = true -- makes the background transparent
-- vim.cmd.colorscheme "adwaita"

vim.cmd.colorscheme "one_monokai"
-- vim.g.tokyodark_transparent_background = true
-- vim.g.tokyodark_enable_italic_comment = false
-- vim.g.tokyodark_enable_italic = false
-- vim.g.tokyodark_color_gamma = "1.0"
-- vim.cmd.colorscheme "tokyodark"

-- vim.cmd.colorscheme "monokai"
-- vim.cmd.colorscheme "horizon"

-- simple status line
-- vim.cmd [[ hi StatusLine NONE ]]

-- cursor line
-- vim.cmd [[ hi CursorLine NONE ]]


-- override colorscheme
-- hi("Normal", { bg = "NONE" })
-- hi("NormalFloat", { bg = "NONE" })
-- hi("LineNr", { bg = "NONE" })
-- hi("CursorLineNr", { bg = "NONE" })
-- hi("SignColumn", { bg = "NONE" })
-- hi("CursorSignColumn", { bg = "NONE" })
hi("CursorLine", { bg = "NONE" })
hi("StatusLine", { bg = "NONE" })

hi("BufferDefaultInactive", { bg = "NONE" })
hi("BufferDefaultCurrent", { bg = "NONE", fg = "#fc9867" })
hi("BufferDefaultVisible", { bg = "NONE" })
hi("BufferDefaultVisibleMod", { bg = "NONE" })
hi("BufferDefaultTabpageFill", { bg = "NONE" })
