require "user.options"
require "user.keymaps"
require "user.plugins"

require "user.config.cmp"
require "user.config.lsp"
require "user.config.telescope"
-- require "user.config.bufferline"
require "user.config.comment"
require "user.config.gitsigns"
require "user.config.toggleterm"
require "user.config.lualine"
require "user.config.treesitter"
-- require "user.config.rust-tools"

-- theme
vim.cmd [[ colorscheme sonokai ]]

-- Theme overrides
vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]

vim.cmd [[ hi LineNr guibg=NONE ]]
vim.cmd [[ hi clear SignColumn ]]
vim.cmd [[ hi CursorLine guibg=#171616 ]]
vim.cmd [[ hi CursorLineNr guibg=#171616 ]]

vim.cmd [[ hi GitSignsChange guibg=NONE guifg=Yellow ]]
vim.cmd [[ hi GitSignsAdd guibg=NONE guifg=#6ffc03 ]]
vim.cmd [[ hi GitSignsDelete guibg=NONE guifg=Red ]]

vim.cmd [[ hi EndOfBuffer guibg=NONE guifg=NONE ]]

