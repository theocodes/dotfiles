(module config.keymaps
   {require-macros [hibiscus.vim]})

(g! mapleader " ")
(g! maplocalleader ",")

(map! [n :verbose] "<C-x><C-e>" ":AniseedEvalFile %<CR>" "Eval fennel file")
(map! [n :verbose] "<Leader><Leader>x" ":AniseedEvalFile %<CR>" "Eval fennel file")

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

(map! [n] "<Leader>." ":FzfLua files<CR>" "Fuzzy find files")
(map! [n] "<Leader>*" ":FzfLua live_grep<CR>" "Grep in project")
(map! [n] "<Leader><TAB>" "<C-^>" "Switch to last buffer")

(map! [n] "<Leader>op" ":Neotree float reveal<CR>" "Toggle file explorer")

(map! [n] "<Leader>bb" ":FzfLua buffers<CR>" "List/Switch buffers")
(map! [n] "<Leader>bd" ":bd<CR>" "Delete buffer")

(defn set-lsp-mappings []
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

