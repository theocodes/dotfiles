(local module {})

(local helpers (require :config.helpers))

(fn set-overrides []
  (let [hi helpers.highlight]
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
    (hi :Whitespace { :bg "#222422" })))

(fn module.init []
  ;; Set colorscheme
  (vim.cmd "colorscheme minimal")

  (set-overrides))

module
