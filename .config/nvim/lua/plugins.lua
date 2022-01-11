local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- multi cursor
  use 'mg979/vim-visual-multi'

  -- theme
  use 'tanvirtin/monokai.nvim'

  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"tami5/sqlite.lua"}
  }

  -- fish syntax highlighting
  use 'dag/vim-fish'

  -- remove trailing whitespace
  use 'nestorsalceda/vim-strip-trailing-whitespaces'

  -- collection of lsp configurations
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- extensions for built-in lsp
  use 'nvim-lua/lsp_extensions.nvim'

  -- roc syntax highlighting
  use 'ChrisWellsWood/roc.vim'

  -- like ivy but different
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'}, 
      {'nvim-lua/plenary.nvim'}, 
      {'kyazdani42/nvim-web-devicons'}
    }
  }

  -- git things
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- because I can't remember my own keybindings
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
  }

  -- lua version of airline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    "projekt0n/circles.nvim",
    requires = {{"kyazdani42/nvim-web-devicons"}, {"kyazdani42/nvim-tree.lua", opt = true}},
    config = function()
      require("circles").setup({
        lsp = false
      })
    end
  }

  -- comments
  use 'terrortylor/nvim-comment'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {

      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'onsails/lspkind-nvim'

  -- nix support
  use 'LnL7/vim-nix'

  -- golang
  use 'fatih/vim-go'

  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }

  -- elixir
  use 'elixir-editors/vim-elixir'
  use 'mhinz/vim-mix-format'

  -- diagnostics list
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- quake terminal
  use 'akinsho/toggleterm.nvim'
end)
