-- space as leader
vim.g.mapleader = ' '
vim.b.mapleader = ' '

-- fuzzy find files
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope git_files theme=get_ivy<CR>', { noremap = true, silent = true })

-- floating term toggle
vim.cmd("let g:floaterm_keymap_toggle = '<C-i>'")

-- toggle floating terminal
-- vim.api.nvim_set_keymap('n', '<C-i>', ':FloatermToggle<CR>', { noremap = true, silent = true })

-- list buffers
-- vim.api.nvim_set_keymap('n', '<Leader>bb', ':Telescope buffers theme=get_ivy<CR>', { noremap = true, silent = true })

-- fuzzy find in buffer
vim.api.nvim_set_keymap('n', '<C-s>', ':Telescope current_buffer_fuzzy_find theme=get_ivy<CR>', { noremap = true, silent = true })

-- live search project
-- vim.api.nvim_set_keymap('n', '<Leader>*', ':Telescope live_grep<CR> theme=get_ivy<CR>', { noremap = true, silent = true })

-- list colorschemes
-- vim.api.nvim_set_keymap('n', '<Leader>lc', ':Telescope colorscheme theme=get_ivy<CR>', { noremap = true, silent = true })

-- toggle file explorer
vim.api.nvim_set_keymap('n', '<C-o>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- explore commands
vim.api.nvim_set_keymap('n', '<C-x>', ':Telescope commands theme=get_ivy<CR>', { noremap = true, silent = true})

-- move selection
vim.api.nvim_set_keymap('v', '<S-LEFT>',  '<gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-RIGHT>', '>gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<S-UP>',   ':move \'<-2<CR>gv-gv\'', { noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<S-DOWN>', ':move \'>+1<CR>gv-gv\'', { noremap = true, silent = true})

-- better window movement (ctrl+hjkl)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true})

-- clear search highlight
vim.api.nvim_set_keymap('n', '<C-c>', ':set hlsearch!<CR>', { noremap = true, silent = true})

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
    ['.'] = {'<Cmd>Telescope fd theme=get_ivy<CR>', 'Find file in directory'},
    ['/'] = {'<Cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>', 'Fuzzy find in buffer'},
    ['*'] = {'<Cmd>Telescope live_grep theme=get_ivy<CR>', 'Search in project'},
    [':'] = {'<Cmd>Telescope commands theme=get_ivy<CR>', 'Explore commands'},
    f = {
        name = '+files',
        f = {'<Cmd>Telescope find_files theme=get_ivy<CR>', 'find files in directory'},
    	  b = {'<Cmd>Telescope file_browser theme=get_ivy<CR>', 'File browser'},
    },
    b = {
        name = '+buffers',
        b = {'<Cmd>Telescope buffers show_all_buffers=true theme=get_ivy<CR>', 'list open buffers'},
        d = {':bd<CR> :bprevious<CR>', 'list open buffers'},
        s = {'<Cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>', 'Search buffer'},
    },
    p = {
        name = '+projects',
        f = {'<Cmd>Telescope git_files theme=get_ivy<CR>', 'find file in project'},
        s = {'<Cmd>Telescope grep_string theme=get_ivy<CR>', 'Search string in project'},
    },
    w = {
        name = '+window',
        v = {':vsplit<CR>', 'vertical split window'},
        h = {':sp<CR>', 'horizontal split window'},
    },
    o = {
        name = '+open',
        p = {':NERDTreeToggle<CR>', 'Toggle project sidebar'},
        m = {'<Cmd>Telescope man_pages theme=get_ivy<CR>', 'Open man pages explorer'},
    },
    g = {
        name = '+git',
        g = {'<Cmd>Telescope git_commits theme=get_ivy<CR>', 'View commits'},
        c = {'<Cmd>Telescope git_bcommits theme=get_ivy<CR>', 'bcommits'},
        b = {'<Cmd>Telescope git_branches theme=get_ivy<CR>', 'Change branches'},
        s = {'<Cmd>Telescope git_status theme=get_ivy<CR>', 'get status'},
    },
    c = {
      name = '+config',
      c = {'<Cmd>Telescope colorscheme theme=get_ivy<CR>', 'Change colorscheme'},
    },
}

wk.register_keymap('leader', keymap)

