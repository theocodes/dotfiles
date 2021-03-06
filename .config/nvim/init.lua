require('plugins')
require('options')
require('keybindings')

require('_gitsigns')
require('_whichkey')
require('_lualine')
require('_compe')

-- comment with gc/gcc
require('nvim_comment').setup()

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end

-- vim.api.nvim_command("autocmd BufEnter * lua require'completion'.on_attach()")

-- Enable rust_analyzer
-- nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
