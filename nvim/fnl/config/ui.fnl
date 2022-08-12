(module config.ui
  {require {: ayu}
   require-macros [macros]})

(ayu.setup { :mirage false })
(vim.cmd "colorscheme ayu")

;; Overrides
(hi! Normal { :bg "NONE" })
(hi! FzfLuaNormal { :bg "NONE" })
(hi! LineNr { :bg "NONE" :fg "#3b4045" })
(hi! SignColumn {})
(hi! CursorLine { :bg "#171616" })
(hi! CursorLineNr { :bg "#171616" :fg "#3b4045" })
(hi! GitSignsChange { :bg "NONE" :fg "Yellow" })
(hi! GitSignsAdd { :bg "NONE" :fg "#6ffc03" })
(hi! GitSignsDelete { :bg "NONE" :fg "Red" })
(hi! EndOfBuffer { :bg "NONE" })
(hi! TabLineFill {})
(hi! ExtraWhitespace { :bg "Red" })
(hi! Whitespace { :bg "#222422" })
