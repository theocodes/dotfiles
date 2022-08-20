(module config.ui
  {require {: ayu}
   require-macros [hibiscus.vim macros]})

(ayu.setup { :mirage false})
(color! "modus-vivendi")

;; Overrides
(hi! Normal { :bg "NONE"})
(hi! NormalNC { :bg "NONE"})
(hi! FzfLuaNormal { :bg "NONE"})
(hi! LineNr { :bg "NONE" :fg "#3b4045"})
(hi! SignColumn {})
(hi! CursorLine { :bg "#120026"})
(hi! CursorLineNr { :bg "#171616" :fg "#3f33af"})
(hi! GitSignsChange { :bg "NONE" :fg "Yellow"})
(hi! GitSignsAdd { :bg "NONE" :fg "#6ffc03"})
(hi! GitSignsDelete { :bg "NONE" :fg "Red"})
(hi! EndOfBuffer { :bg "NONE"})
(hi! TabLineFill {})
(hi! ExtraWhitespace { :bg "Red"})
(hi! Whitespace { :bg "#222422"})
(hi! NormalFloat { :bg "NONE"})

(hi! IndentBlanklineIndent1 {:fg "#1f1f1e"})

