local opt = vim.opt

vim.g.mapleader = " "

opt.tabstop = 2
opt.shiftwidth = 2
opt.backup = false
opt.swapfile = false
opt.clipboard = { "unnamed", "unnamedplus" }
opt.cmdheight = 1
opt.hlsearch = true
opt.expandtab = true
opt.cursorline = true
opt.undofile = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 2
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = false
opt.termguicolors = true
opt.mouse = "a"
opt.list = true
opt.listchars = "tab:»·,trail:·,nbsp:~"
opt.completeopt = { "menu", "menuone", "noselect"}
