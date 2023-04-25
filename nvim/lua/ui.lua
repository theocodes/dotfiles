
-- set colorscheme
vim.g.moonflyItalics = false
vim.g.moonflyTransparent = true
vim.g.moonflyNormalFloat = false
vim.cmd.colorscheme "moonfly"

-- vim.g.adwaita_darker = true -- for darker version
-- vim.g.adwaita_disable_cursorline = true -- to disable cursorline
-- vim.g.adwaita_transparent = true -- makes the background transparent
-- vim.cmd.colorscheme "adwaita"

vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd.colorscheme "tokyodark"

-- simple status line
vim.cmd [[ hi StatusLine NONE ]]
