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
  use 'rstacruz/vim-closer'                    -- Automagically close things
  use "akinsho/bufferline.nvim"                -- Display buffers and tabs
  use "terrortylor/nvim-comment"               -- Commeting goodness
  use "lewis6991/gitsigns.nvim"                -- Nice git integrations with buffers
  use "akinsho/toggleterm.nvim"                -- Togglable term used for lazygit etc
  use 'nvim-lualine/lualine.nvim'              -- Better line

  -- Colorschemes
  use 'tanvirtin/monokai.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                       -- The completion plugin
  use "hrsh7th/cmp-buffer"                     -- Buffer completions
  use "hrsh7th/cmp-path"                       -- Path completions
  use "hrsh7th/cmp-cmdline"                    -- Cmdline completions
  use "hrsh7th/cmp-nvim-lsp"                   -- More types of completion
  use "saadparwaiz1/cmp_luasnip"               -- Snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip"                       -- Snippet engine
  use "rafamadriz/friendly-snippets"           -- A bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "p00f/nvim-ts-rainbow"

  -- Sidebar explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
