(import-macros {: g!
                : map!} :hibiscus.vim)

(local denote (require :denote))
(local wk (require :which-key))
(local t (require :config.plugins.toggleterm))

(g! mapleader " ")
(g! maplocalleader ",")

(map! [n :verbose] "<C-x><C-e>" ":FnlBuffer<CR>" "Eval fennel file")
(map! [n] "q" ":q!<CR>" "Close window without saving")
(map! [n] "s" ":HopWord<CR>" "Hop to word anywhere")
(map! [n] "<C-c>" ":set hlsearch!<CR>" "Clear search highlighting")
(map! [n] "<C-p>" ":FzfLua git_files<CR>" "Fuzzy find files in git")
(map! [n] "<C-s>" ":FzfLua blines<CR>" "Fuzy find in buffer")
(map! [n] "I" ":Gitsigns preview_hunk<CR>" "Show changed hunk")
(map! [n] "H" "<Plug>(cokeline-focus-prev)<CR>" "Previous tab")
(map! [n] "L" "<Plug>(cokeline-focus-next)<CR>" "Next tab")
(map! [v] "<TAB>" ">gv" "Indent selected block")
(map! [v] "<S-TAB>" "<gv" "Dedent selected block")
(map! [x] "J" ":move '>+1<CR>gv-gv" "Move block down")
(map! [x] "K" ":move '<-2<CR>gv-gv" "Move block up")
(map! [n :verbose] ";" ":!" "Run command")
(map! [n] "<C-h>t" "<cmd>FzfLua help_tags<CR>" "Help tags")

; Move these to localleader?
(map! [n] "<leader>mtv" 't.run-spec-file "Run rspec file")
(map! [n] "<leader>mts" 't.run-single-spec "Run single spec")

(wk.register
  {:. ["<cmd>FzfLua files<CR>" "Fuzzy find files"]
   :* ["<cmd>FzfLua live_grep_native<CR>" "Grep in project"]
   :<TAB> ["<C-^>" "Switch to last buffer"]

   :g {:name "git"
       :g [t.lazygit-toggle "Open lazygit"]
       :s ["<cmd>FzfLua git_status<CR>" "Status"]
       :z ["<cmd>FzfLua git_stash<CR>" "Stash"]
       :b ["<cmd>FzfLua git_branches<CR>" "Branches"]
       :l {:name "log"
           :l ["<cmd>FzfLua git_commits<CR>" "All files"]
           :b ["<cmd>FzfLua git_bcommits<CR>" "Current buffer"]}}

   :o {:name "open"
       :p ["<cmd>Neotree float reveal<CR>" "Toggle file explorer"]}

   :b {:name "buffers"
       :b ["<cmd>FzfLua buffers<CR>" "List open buffers"]
       :d [":bd<CR>" "Delete current buffer"]}

   :n {:name "notes"
       :n ["<cmd>Neotree ~/Dropbox/notes<CR>" "Open notes directory"]
       :f ["<cmd>FzfLua files cwd=~/Dropbox/notes<CR>" "Find note"]
       :c [denote.capture-note "Capture note"]}

   :j {:name "journal"
       :c [t.journal-capture "Capture a journal entry"]}

   :m {:name "misc"
       :s ["<cmd>FzfLua spell_suggest<CR>" "Suggest spellings"]}

   :v {:name "vim"
       :h ["<cmd>FzfLua help_tags<CR>" "Help tags"]}}
  { :prefix "<Leader>"})

(fn set-lsp-mappings []
 "Called when an lsp server is attached to the current buffer."
 (map! [n :buffer] "<Leader>ca" 'vim.lsp.buf.code_action "Show code actions prompt")
 (map! [n :buffer] "<Leader>dp" 'vim.diagnostic.goto_prev "Move to previous error")
 (map! [n :buffer] "<Leader>dn" 'vim.diagnostic.goto_next "Move to next error")
 (map! [n :buffer] "<Leader>dlb" "<cmd>FzfLua diagnostics_document<cr>" "Show errors in buffer")
 (map! [n :buffer] "<Leader>dlp" "<cmd>FzfLua diagnostics_workspace<cr>" "Show errors in project")
 (map! [n :buffer] "gd" 'vim.lsp.buf.definition "Go to definition")
 (map! [n :buffer] "gt" 'vim.lsp.buf.type_definition "Go to type definition")
 (map! [n :buffer] "gi" 'vim.lsp.buf.implementation "Go to implementation")
 (map! [n :buffer] "rn" 'vim.lsp.buf.rename "Rename references in buffer")
 (map! [n :buffer] "K" 'vim.lsp.buf.hover "Describe thing under the cursor"))

{:set-lsp-mappings set-lsp-mappings}
