local o = vim.opt

o.tabstop = 2
o.shiftwidth = 2
o.backup = false
o.swapfile = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.hlsearch = true
o.expandtab = true
o.cursorline = true
o.undofile = true
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 2
o.sidescrolloff = 8
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true
o.smartindent = false
o.termguicolors = true
o.mouse = "a"
o.list = true
o.listchars = "tab:»·,trail:·,nbsp:~"
o.completeopt = { "menu", "menuone", "noselect" }

vim.cmd [[set noshowmode]]
