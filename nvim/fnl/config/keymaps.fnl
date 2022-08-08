(import-macros {: map! : g!} :hibiscus.vim)

(g! mapleader " ")
(g! maplocalleader ",")

(map! [n :verbose] "<C-x>e" ":FnlFile %<CR>" "Eval fennel file")
(map! [n] "q" ":q!<CR>" "Close window without saving")
(map! [n] "s" ":HopWord<CR>" "Hop to word anywhere")

(map! [n] "<C-c>" ":set hlsearch!<CR>" "Clear search highlighting")
(map! [n] "<C-p>" ":FzfLua git_files<CR>" "Fuzzy find files")
(map! [n] "<C-s>" ":FzfLua blines<CR>" "Fuzy find in buffer")

(map! [n] "I" ":Gitsigns preview_hunk<CR>" "Show changed hunk")
(map! [n] "H" "<Plug>(cokeline-focus-prev)<CR>" "Previous tab")
(map! [n] "L" "<Plug>(cokeline-focus-next)<CR>" "Next tab")

(map! [v] "<TAB>" ">gv" "Indent selected block")
(map! [v] "<S-TAB>" "<gv" "Dedent selected block")

(map! [x] "J" ":move '>+1<CR>gv-gv" "Move block down")
(map! [x] "K" ":move '<-2<CR>gv-gv" "Move block up")

(map! [n] "<Leader>*" ":FzfLua live_grep<CR>" "Grep in project")
(map! [n] "<Leader><TAB>" "<C-^>" "Switch to last buffer")

(map! [n] "<Leader>op" ":NeoTreeRevealToggle<CR>" "Toggle file explorer")

(map! [n] "<Leader>bb" ":FzfLua buffers<CR>" "List/Switch buffers")
(map! [n] "<Leader>bd" ":bd<CR>" "Delete buffer")
