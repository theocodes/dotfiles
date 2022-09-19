(import-macros {: augroup! : map!} :hibiscus.vim)

(local toggleterm (require :toggleterm))

(toggleterm.setup
  {:size 20
   :hide_numbers true
   :direction "float"
   :start_in_insert true
   :insert_mappings true
   :shade_terminals true
   :close_on_exit true
   :shell vim.o.shell
   :float_opts {:border "single"
                :winblend 0
                :highlights {:border "Normal"
                             :background "Normal"}}})

(local t (require :toggleterm.terminal))
(local terminal t.Terminal)

(fn term-for-command [cmd]
  "Returns an initialized terminal with the given command to be toggled."
  (terminal:new { :cmd cmd :hidden true :direction "float" :close_on_exit false}))

(fn run-async-command [{:args args}]
  "Returns an initialized terminal with the given command to be toggled."
  (let [term (terminal:new { :cmd args :hidden true :direction "horizontal" :close_on_exit false})]
    (term:toggle)))

(vim.api.nvim_create_user_command "Cmd" run-async-command {:nargs :?})

(local lazygit (terminal:new { :cmd "lazygit" :hidden true :direction "float"}))
(map! [n] "<leader>gg" (lambda [] (lazygit:toggle) "Runs lazygit"))

(fn run-single-spec []
  "Runs a single spec in a 'toggleterm' window."
  (let [file (vim.api.nvim_eval "expand('%')")
        line (vim.api.nvim_eval "line('.')")
        term (term-for-command (.. "rspec " file ":" line))]
    (term:toggle)))

(map! [n] "<leader>mts" 'run-single-spec "Run single spec")

(fn run-spec-file []
  "Runs a spec file in a 'toggleterm' window."
  (let [file (vim.api.nvim_eval "expand('%')")
        term (term-for-command (.. "rspec " file))]
    (term:toggle)))

(map! [n] "<leader>mtv" 'run-spec-file "Runs spec file")

(fn set-terminal-keymaps []
  (vim.api.nvim_buf_set_keymap 0 "t" "<C-n>" "<C-\\><C-n>" {:noremap true}))

(augroup! :termtoggle
  [[TermOpen] term://* 'set-terminal-keymaps])