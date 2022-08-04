
(fn hi [highlight opts]
  "Sets the Highlight group with the provided options."
  (vim.api.nvim_set_hl 0 highlight opts))

;; Set colorscheme
(vim.cmd "colorscheme ayu")

;; Highlights overrides
(hi :Normal { :bg "NONE" })
(hi :FzfLuaNormal { :bg "NONE" })
(hi :LineNr { :bg "NONE" })
(hi :SignColumn {})
(hi :CursorLine { :bg "#171616" })
(hi :CursorLineNr { :bg "#171616" })
(hi :GitSignsChange { :bg "NONE" :fg "Yellow" })
(hi :GitSignsAdd { :bg "NONE" :fg "#6ffc03" })
(hi :GitSignsDelete { :bg "NONE" :fg "Red" })
(hi :EndOfBuffer { :bg "NONE" })
(hi :TabLineFill {})
(hi :ExtraWhitespace { :bg "Red" })
(hi :Whitespace { :bg "#222422" })

