(module config.plugins.cokeline
  {require {: cokeline
            utils "cokeline/utils"}})

(def- get-hex utils.get_hex)
(def- config {})

(set config.show_if_buffers_are_at_least 1)
(set config.mappings {:cycle_prev_next true})

(set config.default_hl {})
(set config.default_hl.fg
     (λ [buffer]
       (if buffer.is_focused "Black" (get-hex "Comment" "fg"))))

(set config.default_hl.bg
     (λ [buffer]
       (if buffer.is_focused (get-hex "String" "fg") "NONE")))

(set config.default_hl.style
     (λ [buffer]
       (if buffer.is_focused "bold" nil)))

(set config.components [])

(table.insert config.components {:text (λ [b] " ")})
(table.insert config.components
              {:text (λ [b] b.unique_prefix)
               :fg (λ [b] (if b.is_focused (get-hex "Normal" "fg") (get-hex "Comment" "fg")))
               :style "italic"})

(table.insert config.components
              {:text (λ [b] b.filename)
               :style (λ [b] (if b.is_focused "bold" nil))})

(table.insert config.components
              {:text (λ [b] (if b.is_modified " ●" ""))
               :fg (λ [b] (if b.is_focused "Black" nil))})

(table.insert config.components {:text " "})

(cokeline.setup config)

