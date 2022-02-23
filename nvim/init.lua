require "user.options"
require "user.keymaps"
require "user.plugins"

require "user.config.cmp"
require "user.config.lsp"
require "user.config.telescope"
require "user.config.comment"
require "user.config.gitsigns"
require "user.config.bufferline"
require "user.config.toggleterm"
require "user.config.lualine"
require "user.config.treesitter"

-- theme
-- vim.cmd [[colorscheme onedark]]

--require('github-theme').setup({
--  theme_style = "dark_default",
--  dark_float = true,
--})

-- vim.cmd('colorscheme onedark')

-- vim.cmd [[colorscheme one]]

-- TODO move this
require('onedark').setup {
  style = 'darker',
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'bold',
    strings = 'none',
    variables = 'none'
  },
  toggle_style_list = {'darker', 'light'}
}
require('onedark').load()
