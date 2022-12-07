(require-macros :hibiscus.vim)

(g! mapleader " ")

;; switch to previous buffer
(map! [n] "<TAB>" "<C-^>")

;; easy motion
(map! [n] :s ":HopWord<CR>")

;; search for help tags
(map! [n] "<leader>hh" "<cmd>FzfLua help_tags<CR>")

;; moving between tabs
(map! [n] :H ":BufferLineCyclePrev<CR>")
(map! [n] :L ":BufferLineCycleNext<CR>")

;; move tabs
(map! [n] "<C-h>" ":BufferLineMovePrev<CR>")
(map! [n] "<C-l>" ":BufferLineMoveNext<CR>")

;; search for highlight groups
(map! [n] "<leader>hi" "<cmd>FzfLua highlights<CR>")

;; eval fnl file
(map! [n] "<C-x><C-e>" ":FnlFile %<CR>")

;; project live grep
(map! [n] "<leader>*" "<cmd>FzfLua live_grep<CR>")

;; fuzy find files
(map! [n] "<C-p>" "<cmd>FzfLua git_files<CR>")
(map! [n] "<leader>pf" "<cmd>FzfLua git_files<CR>")
(map! [n] "<leader>." "<cmd>FzfLua files<CR>")

;; clear search highlights
(map! [n] "<esc>" "<cmd>nohlsearch<CR>")

;; quit
(map! [n] "Q" ":q!<CR>")

;; kill current buffer
(map! [n] "q" ":bd<CR>")
(map! [n] "<leader>bd" ":bd<CR>")
(map! [n] "<leader>ba" ":BufferCloseAllButCurrentOrPinned<CR>")
(map! [n] "<leader>bp" ":BufferPin<CR>")

;; list buffers
(map! [n] "<leader>bb" "<cmd>FzfLua buffers<CR>")

;; open file explorer
(map! [n] "<leader>op" "<cmd>Neotree reveal float<CR>")
(map! [n] "<C-o>" "<cmd>Neotree reveal float<CR>")

;; preview hunk
(map! [n] "I" "<cmd>Gitsigns preview_hunk<CR>")

;; indent/Dedent selection
(map! [v] "<TAB>" ">gv")
(map! [v] "<S-TAB>" "<gv")

;; move block up and down
(map! [x] "J" ":move '>+1<CR>gv-gv")
(map! [x] "K" ":move '<-2<CR>gv-gv")

;; fuzzy find line
(map! [n] "<C-s>" ":FzfLua blines<CR>")

;; some useful git mappings)
(map! [n] "<leader>gb" ":Git blame<CR>")
(map! [n] "<leader>ga" ":Git add<CR>")

(g! copilot_no_tab_map true)
(map! [i :script :expr] "<C-f>" "copilot#Accept(\"<CR>\")")

