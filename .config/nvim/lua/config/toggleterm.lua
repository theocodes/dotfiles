require'toggleterm'.setup {
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = { 'none', 'lazygit' },
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  direction = 'horizontal', -- 'vertical' | 'horizontal' | 'window' | 'float'
  persist_size = true,
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
