-- relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'

-- highlight search
vim.o.hlsearch = true

-- true colors
vim.o.termguicolors = true

-- splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- ignore casing in search patterns
vim.o.ignorecase = true

-- don't wrap text
vim.wo.wrap = false

-- tabs
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- don't show current mode
vim.o.showmode = false

-- persistent undo history
vim.bo.undofile=true

vim.cmd("colorscheme dracula")
vim.cmd('set history=2000')
vim.cmd('set clipboard+=unnamedplus')
vim.cmd('set completeopt=menuone,noinsert,noselect')
