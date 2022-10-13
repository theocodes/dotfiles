local map = require("utils").map

-- Set leader to space
vim.g.mapleader = " "

-- Switch to prev buffer
map("n", "<TAB>", "<C-^>")

-- Easy motion
map("n", "s", ":HopWord<CR>")

-- Search for help tags
map("n", "<leader>hh", "<cmd>FzfLua help_tags<CR>")

-- Moving between tabs
map("n", "H", ":BufferLineCyclePrev<CR>", { silent = true})
map("n", "L", ":BufferLineCycleNext<CR>", { silent = true})

-- Move tabs
map("n", "<C-h>", ":BufferLineMovePrev<CR>", { silent = true})
map("n", "<C-l>", ":BufferLineMoveNext<CR>", { silent = true})

-- Pin tab
map("n", "<leader>tp", "<cmd>BufferLineTogglePin<CR>", { silent = true })

-- List highlights
map("n", "<leader>hi", "<cmd>FzfLua highlights<CR>")

-- Eval lua file
map("n", "<C-x><C-e>", ":so<CR>", { silent = true })

-- Project live grep
map("n", "<leader>*", "<cmd>FzfLua live_grep<CR>")

-- Fuzzy-find files
map("n", "<C-p>", "<cmd>FzfLua git_files<CR>", { silent = true })
map("n", "<leader>pf", "<cmd>FzfLua git_files<CR>", { silent = true })
map("n", "<leader>.", "<cmd>FzfLua files<CR>", { silent = true })

-- Clear search highlight
map("n", "<esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Quit
map("n", "Q", ":q!<CR>", { silent = true })

-- Kill current buffer
map("n", "q", ":bd<CR>", { silent = true })
map("n", "<leader>bd", ":bd<CR>", { silent = true })
map("n", "<leader>ba", ":BufferCloseAllButCurrentOrPinned<CR>")
map("n", "<leader>bp", ":BufferPin<CR>")

-- List buffers
map("n", "<leader>bb", "<cmd>FzfLua buffers<CR>", { silent = true })

-- Open file explorer
map("n", "<leader>op", "<cmd>Neotree reveal float<CR>", { silent = true })
map("n", "<C-o>", "<cmd>Neotree reveal float<CR>", { silent = true })

-- Preview hunk
map("n", "I", "<cmd>Gitsigns preview_hunk<CR>", { silent = true })

-- Indent/Dedent selection
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Move block up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- Fuzzy find line
map("n", "<C-s>", ":FzfLua blines<CR>")

-- Some useful git mappings
map("n", "<leader>gb", ":Git blame<CR>")
map("n", "<leader>ga", ":Git add<CR>")
