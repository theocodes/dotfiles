local helpers = require "user.config.helpers"

-- require "user.options"
-- require "user.keymaps"
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

-- require'lsp_extensions'.inlay_hints{
--   highlight = "Comment",
--   prefix = " > ",
--   aligned = false,
--   only_current_line = false,
--   enabled = { "ChainingHint" }
-- }

-- Load Fennel --

local hotpot_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/hotpot.nvim'

if vim.fn.empty(vim.fn.glob(hotpot_path)) > 0 then
  print("Could not find hotpot.nvim, cloning new copy to", hotpot_path)
  vim.fn.system({'git', 'clone',
                 'https://github.com/rktjmp/hotpot.nvim', hotpot_path})
  vim.cmd("helptags " .. hotpot_path .. "/doc")
end

-- Enable fnl/ support
require("hotpot")

-- Load init
require "init"
