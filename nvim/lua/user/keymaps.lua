local map = vim.api.nvim_set_keymap
local term_opts = { noremap = true }
local opts = { noremap = true, silent = true }

local normal = function(key, action, o)
  o = o or opts
  return map("n", key, action, o)
end

local insert = function(key, action, o)
  o = o or opts
  return map("i", key, action, o)
end

local visual = function(key, action, o)
  o = o or opts
  return map("v", key, action, o)
end

local visual_block = function(key, action, o)
  o = o or opts
  return map("x", key, action, o)
end

-- Space as leader
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Window navigation
normal("<C-h>", "<C-w>h")
normal("<C-j>", "<C-w>j")
normal("<C-k>", "<C-w>k")
normal("<C-l>", "<C-w>l")

-- Resize with arrows
normal("<C-Left>", ":vertical resize -2<cr>")
normal("<C-Right>", ":vertical resize +2<cr>")
normal("<C-Up>", ":resize +2<cr>")
normal("<C-Down>", ":resize -2<cr>")

-- Explorer
normal("<C-o>", ":Lex 30<cr>")

-- Indent selection
visual("<TAB>", ">gv")
visual("<S-TAB>", "<gv")

-- Move block
visual_block("J", ":move '>+1<CR>gv-gv")
visual_block("K", ":move '<-2<CR>gv-gv")

-- Working with tabs
normal('tn', ':tabnew<cr>')
normal('tk', ':tabnext<cr>')
normal('tj', ':tabprev<cr>')
normal('to', ':tabo<cr>')

-- Run shell command
normal(';', ':!', term_opts)

-- Clear search highlight
normal('<C-c>', ':set hlsearch!<CR>')

-- run current spec
-- vim.api.nvim_set_keymap('n', '<leader>mtv', ':call RunCurrentSpecFile()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>mts', ':call RunNearestSpec()<CR>', { noremap = true })

-- Quit buffer with q
normal("q", ":q!<CR>")

-- LSP installer gui
normal("<leader>lsp", ":LspInstallInfo<CR>")

-- Fuzzy files in current project
normal("<C-p>", "<cmd>Telescope fd<cr>")
normal("<leader>pf", "<cmd>Telescope fd<cr>")

-- Fuzzy current buffer
normal("<C-s>", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- Live grep project
normal("<leader>*", "<cmd>Telescope live_grep<cr>")

-- Fuzzy buffer list
normal("<leader>bb", "<cmd>Telescope buffers show_all_buffers=true<cr>")

-- Kill current buffer
normal("<leader>bd", ":bd<CR>")

-- Last opened buffer
normal("<leader><TAB>", "<C-^>")

-- Split window
normal("<leader>vs", ":vs<CR>")
normal("<leader>hs", ":sp<CR>")

-- Toggle sidebar explorer
normal("<leader>op", ":NvimTreeToggle<CR>")

-- Move between buffers
normal("H", ":BufferLineCyclePrev<CR>")
normal("L", ":BufferLineCycleNext<CR>")

-- Toggle terminal
normal("<C-o>", ":ToggleTerm<CR>")
normal("<leader>gg", ":lua _LAZYGIT_TOGGLE()<CR>")
normal("<leader>irb", ":lua _IRB_TOGGLE()<CR>")
normal("<leader>node", ":lua _NODE_TOGGLE()<CR>")
normal("<leader>mtv", ":lua _RSPEC_SPEC()<CR>")

-- Center screen on insert
vim.cmd("autocmd InsertEnter * norm zz")


