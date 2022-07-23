local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"                 -- Have packer manage itself
  use "nvim-lua/popup.nvim"                    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                  -- Useful lua functions used by lots of plugins
  use "rstacruz/vim-closer"                    -- Automagically close things
  use "terrortylor/nvim-comment"               -- Commeting goodness
  use "lewis6991/gitsigns.nvim"                -- Nice git integrations with buffers
  use "akinsho/toggleterm.nvim"                -- Togglable term used for lazygit etc
  use "nvim-lualine/lualine.nvim"              -- Better line
  use "axelf4/vim-strip-trailing-whitespace"   -- Trim whitespace
  use "maxjacobson/vim-fzf-coauthorship"       -- Get co-authors
  use { 'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use "mg979/vim-visual-multi"
  use "kyazdani42/nvim-web-devicons"
  use "noib3/nvim-cokeline"
  use "machakann/vim-highlightedyank"          -- Highlight yanks
  -- use "lukas-reineke/indent-blankline.nvim"    -- Show indentation lines

  -- motion tool
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Session management
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/', '~/Projects'}
      }
    end
  }

  -- Colorschemes
  use 'tanvirtin/monokai.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'navarasu/onedark.nvim'
  use 'rafi/awesome-vim-colorschemes'
  use 'andreypopp/vim-colors-plain'
  use 'chriskempson/base16-vim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                       -- The completion plugin
  use "hrsh7th/cmp-buffer"                     -- Buffer completions
  use "hrsh7th/cmp-path"                       -- Path completions
  use "hrsh7th/cmp-cmdline"                    -- Cmdline completions
  use "hrsh7th/cmp-nvim-lsp"                   -- More types of completion
  use "saadparwaiz1/cmp_luasnip"               -- Snippet completions
 	-- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  -- snippets
  use "L3MON4D3/LuaSnip"                       -- Snippet engine
  use "rafamadriz/friendly-snippets"           -- A bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "nvim-lua/lsp_extensions.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "p00f/nvim-ts-rainbow"

  -- Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- rust
  use "rust-lang/rust.vim"
  use "simrat39/rust-tools.nvim"

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        auto_open = true,
        auto_close = true
      }
    end
  }

  -- golang
  use "fatih/vim-go"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

