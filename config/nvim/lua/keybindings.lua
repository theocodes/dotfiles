-- space as leader
vim.g.mapleader = ' '
vim.b.mapleader = ' '

-- fuzzy find files
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope fd theme=get_ivy<CR>', { noremap = true, silent = true })

-- fuzzy find in buffer
vim.api.nvim_set_keymap('n', '<C-s>', ':Telescope current_buffer_fuzzy_find theme=get_ivy<CR>', { noremap = true, silent = true })

-- working with tabs
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<cr>', { noremap = true, silent = true })

-- toggle file explorer
vim.api.nvim_set_keymap('n', '<C-o>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

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

-- run shell command
vim.api.nvim_set_keymap('n', ';', ':! ', { noremap = true})

-- describe symbol
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true})

-- go to definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true})

-- show refenrences
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true})

-- show lsp diagnostics
vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', { noremap = true, silent = true })

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
    l = {
      name = "+local",
      c = {':LspInstallInfo<CR>', 'placeholder'},
    },
    t = {
      name = "+toggle",
      t = {':TroubleToggle<CR>', 'Toggle diagnostics'},
    },
    g = {
        name = '+git',
        g = {'<Cmd>Telescope git_commits theme=get_ivy<CR>', 'View commits'},
        c = {'<Cmd>Telescope git_bcommits theme=get_ivy<CR>', 'bcommits'},
        b = {'<Cmd>Telescope git_branches theme=get_ivy<CR>', 'Change branches'},
        s = {'<Cmd>Telescope git_status theme=get_ivy<CR>', 'get status'},
        h = {
          name = '+hunk',
          s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', 'stage hunk'},
          u = {'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'undo stage hunk'},
          r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>', 'reset hunk'},
          R = {'<cmd>lua require"gitsigns".reset_buffer()<CR>', 'reset buffer'},
          p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', 'preview hunk'},
          S = {'<cmd>lua require"gitsigns".stage_buffer()<CR>', 'stage buffer'},
          U = {'<cmd>lua require"gitsigns".reset_buffer_index()<CR>', 'reset buffer index'},
        },
    },
    c = {
      name = '+config',
      c = {'<Cmd>Telescope colorscheme theme=get_ivy<CR>', 'Change colorscheme'},
      l = {':LspInstallInfo<CR>', 'Manage LSP configurations'},
      p = {
        name = '+plugins',
        s = {':PackerSync<cr>', 'Sync plugins'},
      },
    },
}

wk.register_keymap('leader', keymap)

