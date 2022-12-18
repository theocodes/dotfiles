(import-macros {: g!
                : color!} :hibiscus.vim)

(fn set-highlight [group rules]
  (vim.api.nvim_set_hl 0 group rules))

(fn get-highlight [group]
  (vim.api.nvim_get_hl_by_name group true))

(color! :catppuccin)

(set-highlight "GitSignsAdd" {:bg "NONE" :fg "#6ffc03"})
(set-highlight "GitSignsDelete" {:bg "NONE" :fg "Red"})
(set-highlight "GitSignsChange" {:bg "NONE" :fg "Yellow"})

(set-highlight "ExtraWhitespace" {:bg "Red"})
(set-highlight "MsgArea" {:bg "NONE"})
(set-highlight "NormalFloat" {:bg "NONE"})

(local primary (get-highlight "String"))
(set-highlight "FloatBorder" {:bg "NONE" :fg "White"})

(set-highlight "Normal" {:bg "NONE"})
(set-highlight "SignColumn" {:bg "NONE"})

nil
