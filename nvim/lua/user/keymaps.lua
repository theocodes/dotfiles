local nvim_map = vim.api.nvim_set_keymap
local term_opts = { noremap = true }
local opts = { noremap = true, silent = true }

local map = function(mode, key, action, o)
  o = o or opts
  return vim.api.nvim_set_keymap(mode, key, action, o)
end

-- Space as leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Left>", ":vertical resize -2<cr>")
map("n", "<C-Right>", ":vertical resize +2<cr>")
map("n", "<C-Up>", ":resize +2<cr>")
map("n", "<C-Down>", ":resize -2<cr>")

-- Explorer
-- map("n", "<C-o>", ":Lex 30<cr>")

-- Indent selection
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Move block
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- Working with tabs
map("n", 'tn', ':tabnew<cr>')
map("n", 'tk', ':tabnext<cr>')
map("n", 'tj', ':tabprev<cr>')
map("n", 'to', ':tabo<cr>')

-- Run shell command
map("n", ';', ':!', term_opts)

-- Clear search highlight
map("n", '<C-c>', ':set hlsearch!<CR>')

-- run current spec
-- vim.api.nvim_set_keymap('n', '<leader>mtv', ':call RunCurrentSpecFile()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>mts', ':call RunNearestSpec()<CR>', { noremap = true })

-- Quit buffer with q
map("n", "q", ":q!<CR>")
-- map("n", "q", ":bd<CR>")

-- LSP installer gui
map("n", "<leader>lsp", ":LspInstallInfo<CR>")

-- Fuzzy files in current project
map("n", "<C-p>", ":GFiles!<CR>")
map("n", "<leader>pf", ":GFiles!<CR>")
map("n", "<leader>.", ":Files!<CR>")
-- map("n", "<C-p>", "<cmd>Telescope fd<cr>")
-- map("n", "<leader>pf", "<cmd>Telescope fd<cr>")

-- open recent files
-- map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>fr", ":History!<CR>")

-- File browser
map("n", "<leader><leader>", ":Telescope file_browser<cr>")

-- Fuzzy current buffer
-- map("n", "<C-s>", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
map("n", "<C-s>", ":BLines<CR>")

-- Live grep project
-- map("n", "<leader>*", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>*", ":Ag!<CR>")

-- Fuzzy buffer list
-- map("n", "<leader>bb", "<cmd>Telescope buffers show_all_buffers=true<cr>")
map("n", "<leader>bb", ":Buffers<CR>")

-- Kill current buffer
map("n", "<leader>bd", ":bd<CR>")

-- Last opened buffer
map("n", "<leader><TAB>", "<C-^>")

-- Split window
map("n", "<leader>vs", ":vs<CR>")
map("n", "<leader>hs", ":sp<CR>")

-- Toggle sidebar explorer
map("n", "<leader>op", ":NERDTreeToggle<CR>")

-- Preview hunk
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")

map("n", "<leader>theme", ":Telescope colorscheme<CR>")
map("n", "<c-x>", ":Telescope commands<CR>")

-- Move between buffers
map("n", "H", "<Plug>(cokeline-focus-prev)<CR>")
map("n", "L", "<Plug>(cokeline-focus-next)<CR>")

-- Toggle terminal
map("n", "<C-\\>", ":ToggleTerm<CR>")
map("n", "<leader>gg", ":lua _LAZYGIT_TOGGLE()<CR>")
map("n", "<leader>irb", ":lua _IRB_TOGGLE()<CR>")
map("n", "<leader>cons", ":lua _RAILS_TOGGLE()<CR>")
map("n", "<leader>mtv", ":lua _RSPEC_SPEC()<CR>")
map("n", "<leader>mts", ":lua _RSPEC_SPEC_SINGLE()<CR>")
map("n", "<leader>node", ":lua _NODE_TOGGLE()<CR>")
map("n", "<leader>nt", ":lua _JOURNAL_TOGGLE()<CR>")
map("n", "<leader>nf", ":lua _NOTES_TOGGLE()<CR>")

-- Center screen on insert
-- vim.cmd("autocmd InsertEnter * norm zz")

-- LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
