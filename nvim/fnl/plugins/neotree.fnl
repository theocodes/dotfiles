(import-macros {: hi!} :macros)

(local neotree (require :neo-tree))

(neotree.setup {:window {:position "float"}
                :popup_border_style "single"})

;; Highlight overrides

(hi! NeoTreeNormal {:bg "NONE"})
(hi! NeoTreeFloatBorder {:fg "NONE" :bg "NONE"})
