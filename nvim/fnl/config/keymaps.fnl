(module config.keymaps
  {autoload {nvim aniseed.nvim}})

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(noremap :n "<space>" "<nop>")
(noremap :n "<Leader>op" ":NeoTreeRevealToggle<CR>")
(noremap :n "<C-x>e" ":AniseedEvalFile %<CR>")
(noremap :n "q" ":q!<CR>")
(noremap :n "s" ":HopWord<CR>")
(noremap :v "<TAB>" ">gv")
(noremap :v "<S-TAB>" "<gv")
(noremap :x "J" ":move '>+1<CR>gv-gv")
(noremap :x "K" ":move '<-2<CR>gv-gv")
(noremap :n "<C-c>" ":set hlsearch!<CR>")
(noremap :n "<Leader><TAB>" "<C-^>")
(noremap :n "<C-p>" ":FzfLua git_files<CR>")
(noremap :n "<C-s>" ":FzfLua blines<CR>")
(noremap :n "<Leader>*" ":FzfLua live_grep<CR>")
(noremap :n "<Leader>bb" ":FzfLua buffers<CR>")
(noremap :n "<Leader>bd" ":bd<CR>")
(noremap :n "<leader>gg" ":lua _LAZYGIT_TOGGLE()<CR>")
(noremap :n "I" ":Gitsigns preview_hunk<CR>")
(noremap :n "H" "<Plug>(cokeline-focus-prev)<CR>")
(noremap :n "L" "<Plug>(cokeline-focus-next)<CR>")
