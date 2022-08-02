local helpers = require "user.config.helpers"

require "user.options"
require "user.keymaps"
require "user.plugins"

require "user.config.cmp"
require "user.config.lsp"
require "user.config.cokeline"
require "user.config.comment"
require "user.config.gitsigns"
require "user.config.toggleterm"
require "user.config.lualine"
require "user.config.neotree"
require "user.config.treesitter"
require "user.config.rust-tools"
require "user.config.fzf"

-- theme
vim.cmd [[ colorscheme minimal ]]

-- Theme overrides
vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
vim.cmd [[ hi FzfLuaNormal guibg=NONE ctermbg=NONE ]]

vim.cmd [[ hi LineNr guibg=NONE ]]
vim.cmd [[ hi clear SignColumn ]]
vim.cmd [[ hi CursorLine guibg=#171616 ]]
vim.cmd [[ hi CursorLineNr guibg=#171616 ]]

vim.cmd [[ hi GitSignsChange guibg=NONE guifg=Yellow ]]
vim.cmd [[ hi GitSignsAdd guibg=NONE guifg=#6ffc03 ]]
vim.cmd [[ hi GitSignsDelete guibg=NONE guifg=Red ]]

vim.cmd [[ hi EndOfBuffer guibg=NONE guifg=NONE ]]
vim.cmd [[ hi clear TabLineFill ]]
vim.cmd [[ hi ExtraWhitespace ctermbg=red guibg=red ]]

vim.cmd [[hi Whitespace guibg=None guifg=#222422]]
vim.cmd [[match Whitespace /\s/]]

require'lsp_extensions'.inlay_hints{
  highlight = "Comment",
  prefix = " > ",
  aligned = false,
  only_current_line = false,
  enabled = { "ChainingHint" }
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab: >")

--vim.cmd [[set lcs+=space:·]]

-- Set up system clipboard for WSL
if helpers.is_wsl then
  vim.cmd [[
    let g:clipboard = {
        \   'name': 'win32yank-wsl',
        \   'copy': {
        \      '+': 'win32yank.exe -i --crlf',
        \      '*': 'win32yank.exe -i --crlf',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o --lf',
        \      '*': 'win32yank.exe -o --lf',
        \   },
        \   'cache_enabled': 0,
        \ }
  ]]
end

