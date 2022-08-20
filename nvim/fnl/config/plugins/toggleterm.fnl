(module config.plugins.toggleterm
  {require {: toggleterm
            t toggleterm.terminal}
   require-macros [hibiscus.vim]})

(local terminal t.Terminal)
(local lazygit (terminal:new { :cmd "lazygit" :hidden true :direction "float"}))

(defn- set-terminal-keymaps []
  (vim.api.nvim_buf_set_keymap 0 "t" "<C-n>" "<C-\\><C-n>" { :noremap true}))

(defn term-for-command [cmd]
  "Returns an initialized terminal with the given command to be toggled."
  (terminal:new { :cmd cmd :hidden true :direction "float" :close_on_exit false}))

(defn lazygit-toggle []
  "Toggles a 'toggleterm' window with lazygit in it."
  (lazygit:toggle))

(defn run-spec-file []
  "Runs a spec file in a 'toggleterm' window."
  (let [file (vim.api.nvim_eval "expand('%')")
        term (term-for-command (.. "rspec " file))]
    (term:toggle)))

(defn run-single-spec []
  "Runs a single spec in a 'toggleterm' window."
  (let [file (vim.api.nvim_eval "expand('%')")
        line (vim.api.nvim_eval "line('.')")
        term (term-for-command (.. "rspec " file ":" line))]
    (term:toggle)))

(augroup! :termtoggle
  [[TermOpen] term://* 'set-terminal-keymaps])

(toggleterm.setup
  {:size 20
   :hide_numbers true
   :direction "float"
   :start_in_insert true
   :insert_mappings true
   :shade_terminals true
   :close_on_exit true
   :shell vim.o.shell
   :float_opts {:border "curved"
                :winblend 0
                :highlights {:border "Normal"
                             :background "Normal"}}})
