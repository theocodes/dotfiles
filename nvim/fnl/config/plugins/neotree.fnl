(module config.plugins.neotree
  {require {: neo-tree}})

(def- config {})

; (set config.popup_border_style "rounded")
(set config.window {})
(set config.window.position "float")

(neo-tree.setup config)
