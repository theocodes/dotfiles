local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- collection of lsp configurations
  use 'neovim/nvim-lspconfig'


  -- horizon colorscheme
  use 'ntk148v/vim-horizon'

  -- extensions for built-in lsp
  use 'nvim-lua/lsp_extensions.nvim'

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

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- comments
  use 'terrortylor/nvim-comment'

  -- project tree view
  use 'preservim/nerdtree'

  -- autocompletion
  use 'hrsh7th/nvim-compe'

  -- nix support
  use 'LnL7/vim-nix'

  -- golang
  use 'fatih/vim-go'

  -- theme
  use {'dracula/vim', as = 'dracula'}

  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- floating term
  -- use 'voldikss/vim-floaterm'

  -- better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }

  -- elixir
  use 'elixir-editors/vim-elixir'
  use 'mhinz/vim-mix-format'
end)
