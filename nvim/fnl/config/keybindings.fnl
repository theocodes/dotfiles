(local wk (require :which-key))

(set vim.g.mapleader " ")

(fn map [mode key result]
  "Remap globally KEY to RESULT in MODE."
  (vim.api.nvim_set_keymap mode key result {:noremap true :silent true}))

(fn leader [key result]
  "Remap globally <Leader>KEY to RESULT in Normal mode."
  (map "n" (.. "<Leader>" key) result {:noremap true :silent true}))

(map :n "<C-h>" "<C-w>h")
(map :n "<C-j>" "<C-w>j")
(map :n "<C-k>" "<C-w>k")
(map :n "<C-l>" "<C-w>l")

(leader "xe" ":Fnlsource %<CR>")

(local mappings {})

(set mappings.f { :name "files" })
(set mappings.f.b [ ":NeoTreeRevealToggle<CR>" "File Browser" ])
(set mappings.f.s [ ":Fnlsource %<CR>" "Source fennel file" ])

(wk.register mappings { :prefix "<leader>" })
