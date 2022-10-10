local map = require("utils").map

-- set leader to space
vim.g.mapleader = " "

-- Switch to prev buffer
map("n", "<TAB>", "<C-^>")

-- fuzzy-find files
map("n", "<C-p>", "<cmd>FzfLua git_files<CR>", { silent = true })
map("n", "<leader>pf", "<cmd>FzfLua git_files<CR>", { silent = true })
map("n", "<leader>.", "<cmd>FzfLua files<CR>", { silent = true })

-- clear search highlight
map("n", "<esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- quit
map("n", "Q", ":q!<CR>", { silent = true })

-- kill current buffer
map("n", "q", ":bd<CR>", { silent = true })

-- list buffers
map("n", "<leader>bb", "<cmd>FzfLua buffers<CR>", { silent = true })

-- open file explorer
map("n", "<leader>op", "<cmd>Neotree reveal float<CR>", { silent = true })

-- preview hunk
map("n", "I", "<cmd>Gitsigns preview_hunk<CR>", { silent = true })

-- Indent/Dedent selection
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Move block up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- Fuzzy find line
map("n", "<C-s>", ":FzfLua blines<CR>")
