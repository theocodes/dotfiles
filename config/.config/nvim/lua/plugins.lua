local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- collection of lsp configurations
  use 'neovim/nvim-lspconfig'

  -- extensions for built-in lsp
  use 'nvim-lua/lsp_extensions.nvim'

  -- autocompletion
  --use 'nvim-lua/completion-nvim'

  -- autocompletion
  use 'hrsh7th/nvim-compe'

  -- fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }

  -- for configuring keybindings behind leader
  use { 'AckslD/nvim-whichkey-setup.lua', requires = {'liuchengxu/vim-which-key'}}

  -- auto adjust tabs/spaces
  use 'tpope/vim-sleuth'

  -- nix syntax highlighting
  use 'LnL7/vim-nix'

  -- nicer statusline modeline
  use { 'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons'} }

  -- comments
  use "terrortylor/nvim-comment"

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
end)
