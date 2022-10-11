local packer = require("packer")

local group = vim.api.nvim_create_augroup("PackerSync", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = ":so | PackerSync",
  group = group
})

return packer.startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- General
  use 'terrortylor/nvim-comment'
  use 'axelf4/vim-strip-trailing-whitespace'
  use 'machakann/vim-highlightedyank'
  use 'dag/vim-fish'
  use 'folke/which-key.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-eunuch'
  use 'nvim-lua/plenary.nvim'

  -- auto pair stuff
  use { 'windwp/nvim-autopairs', module = 'nvim-autopairs.completion.cmp' }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Git in the gutter
  use 'lewis6991/gitsigns.nvim'

  -- Floating terminal
  use 'akinsho/toggleterm.nvim'

  -- Fzf integration
  use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'maxjacobson/vim-fzf-coauthorship', requires = { 'junegunn/fzf' } }

  -- File-tree explorer
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Easy motion
  use { 'phaazon/hop.nvim', branch = 'v2' }

  -- Autocompletion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'

  -- Treesitter integration
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Prettier statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Session management
  use 'rmagatti/auto-session'

  -- Indentation lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Colorschemes
  use 'Mofiqul/adwaita.nvim'
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
