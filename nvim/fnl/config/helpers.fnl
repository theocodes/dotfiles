(local module {})

(fn module.highlight [hi opts]
  "Sets the Highlight group with the provided options."
  (vim.api.nvim_set_hl 0 hi opts))

(fn module.map [mode key result]
  "Remap globally KEY to RESULT in MODE."
  (vim.api.nvim_set_keymap mode key result {:noremap true :silent true}))

module
