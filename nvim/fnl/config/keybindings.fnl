(local module {})

(local helpers (require :config.helpers))
(local plugins (require :config.plugins))

(plugins.add :which-key)

(local wk (require :which-key))

;; Leader is space
(set vim.g.mapleader " ")

(fn setup-which-key []
  (let [leader {}]

    (set leader.* [ ":FzfLua live_grep<CR>" "Grep project" ])
    (set leader.<TAB> [ "<C-^>" "Switch to previous buffer" ])

    (let [f {:name "files"}]
      (set f.b [ ":NeoTreeRevealToggle<CR>" "File Browser" ])
      (set f.s [ ":source %<CR>" "Source file" ])
      (set leader.f f))

    (let [p {:name "project"}]
      (set p.f [ ":FzfLua files<CR>" "Find project file" ])
      (set leader.p p))

    (let [b {:name "buffers"}]
      (set b.b [ ":FzfLua buffers<CR>" "Switch buffers" ])
      (set b.d [ ":bd<CR>" "Delete buffer" ])
      (set leader.b b))

    (wk.register leader { :prefix "<leader>" })))

(fn setup-global-bindings []
  (let [map helpers.map]
    ;; Split navigation
    (map :n "<C-h>" "<C-w>h")
    (map :n "<C-j>" "<C-w>j")
    (map :n "<C-k>" "<C-w>k")
    (map :n "<C-l>" "<C-w>l")

    ;; Ident selection
    (map :v "<TAB>" ">gv")
    (map :v "<S-TAB>" "<gv")

    ;; Run shell command
    (map :n ";" ":!")

    ;; Move block
    (map :x "J" ":move '>+1<CR>gv-gv")
    (map :x "K" ":move '<-2<CR>gv-gv")

    ;; Clear search highlight
    (map :n "<C-c>" ":set hlsearch!<CR>")

    ;; Quit buffer
    (map :n "q" ":q!<CR>")

    ;; Fuzzy find file
    (map :n "<C-p>" ":FzfLua git_files<CR>")

    ;; Fuzzy find in file
    (map :n "<C-s>" ":FzfLua blines<CR>")

    ;; Preview changed hunk
    (map :n "I" ":Gitsigns preview_hunk<CR>")

    ;; Move between buffers
    (map :n "H" "<Plug>(cokeline-focus-prev)<CR>")
    (map :n "L" "<Plug>(cokeline-focus-next)<CR>")

    ;; Easy motion within buffer
    (map :n "s" ":HopWord<CR>")))

(fn module.init []
  (setup-which-key)
  (setup-global-bindings))

module
