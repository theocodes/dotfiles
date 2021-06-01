-- space for leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ' '

-- clear search highlight
vim.api.nvim_set_keymap('n', '<C-c>', ':set hlsearch!<CR>', { noremap = true, silent = true})

-- better window movement (ctrl+hjkl)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true})

-- move selection
vim.api.nvim_set_keymap('v', '<S-LEFT>',  '<gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-RIGHT>', '>gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<S-UP>',   ':move \'<-2<CR>gv-gv\'', { noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<S-DOWN>', ':move \'>+1<CR>gv-gv\'', { noremap = true, silent = true})

-- Find file in directory
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope fd<CR>', { noremap = true, silent = true})

-- explore commands
vim.api.nvim_set_keymap('n', '<C-x>', ':Telescope commands<CR>', { noremap = true, silent = true})

-- search in buffer
vim.api.nvim_set_keymap('n', '<C-s>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true})

-- close buffers with 'q'
vim.api.nvim_set_keymap('n', 'q', ':q!<CR>', { noremap = true, silent = true})

-- describe symbol
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true})

-- go to definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true})

-- show refenrences
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true})

-- autocomplete
vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? \"\\<C-n>\" : \"<TAB>\" ", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "pumvisible() ? \"\\<C-p>\" : \"<C-h>\" ", {expr = true})
vim.api.nvim_set_keymap("i", "<C-j>", "pumvisible() ? \"\\<C-n>\" : \"<C-n>\" ", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "pumvisible() ? \"\\<C-p>\" : \"<C-p>\" ", {expr = true})

local wk = require('whichkey_setup')
local keymap = {
    ['<TAB>'] = {'<C-^>', 'Previous buffer'},
    ['.'] = {'<Cmd>Telescope fd<CR>', 'Find file in directory'},
    ['/'] = {'<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'Fuzzy find in buffer'},
    ['*'] = {'<Cmd>Telescope live_grep<CR>', 'Search in project'},
    f = {
        name = '+files',
        f = {'<Cmd>Telescope find_files<CR>', 'find files in directory'},
    	b = {'<Cmd>Telescope file_browser<CR>', 'File browser'},
    },
    b = {
        name = '+buffers',
        b = {'<Cmd>Telescope buffers show_all_buffers=true<CR>', 'list open buffers'},
        d = {':bd<CR> :bprevious<CR>', 'list open buffers'},
        s = {'<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'Search buffer'},
    },
    p = {
        name = '+projects',
        f = {'<Cmd>Telescope git_files<CR>', 'find file in project'},
        s = {'<Cmd>Telescope grep_string<CR>', 'Search string in project'},
    },
    w = {
        name = '+window',
        v = {':vsplit<CR>', 'vertical split window'},
        h = {':sp<CR>', 'horizontal split window'},
    },
    o = {
        name = '+open',
        p = {':NvimTreeToggle<CR>', 'Toggle project sidebar'},
        m = {'<Cmd>Telescope man_pages<CR>', 'Open man pages explorer'},
    },
    g = {
        name = '+git',
        g = {'<Cmd>Telescope git_commits<CR>', 'View commits'},
        c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
        b = {'<Cmd>Telescope git_branches<CR>', 'Change branches'},
        s = {'<Cmd>Telescope git_status<CR>', 'get status'},
    },
}

wk.register_keymap('leader', keymap)
