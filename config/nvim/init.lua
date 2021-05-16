require('plugins')
require('keybindings')

-- ref for running vim commands
local cmd = vim.cmd

-- plugin settings
require("_compe")
require("_whichkey")
require("_galaxyline")
require("_go")
require("_rust")

-- personal settings
vim.o.termguicolors = true
cmd 'colorscheme dracula'
cmd 'set number relativenumber'
cmd 'set history=2000'
cmd 'set undofile'
cmd 'set clipboard+=unnamedplus'
cmd 'set completeopt=menuone,noinsert,noselect'

-- comments with gc,ggc
require('nvim_comment').setup()

