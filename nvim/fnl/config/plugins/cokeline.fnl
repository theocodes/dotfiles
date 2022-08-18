(module config.plugins.cokeline
  {require {: cokeline
            utils "cokeline/utils"}})

(def- get-hex utils.get_hex)
(def- config {})

(def- default-foreground (get-hex "Comment" "fg"))
(def- selected-foreground "White")
(def- default-background "NONE")
(def- selected-background (get-hex "String" "fg"))
(def- default-modified-state nil)
(def- selected-modified-state "White")

(def- foreground
     (λ [buffer]
       (if buffer.is_focused selected-foreground default-foreground)))

(def- background
     (λ [buffer]
       (if buffer.is_focused selected-background default-background)))

(def- style
     (λ [buffer]
       (if buffer.is_focused "bold" nil)))

(def- padding
  {:text " "})

(def- something
  {:text (λ [b] b.unique_prefix)
   :fg (λ [b] (if b.is_focused (get-hex "Normal" "fg") (get-hex "Comment" "fg")))
   :style "italic"})

(def- name
  {:text (λ [b] b.filename)
   :style (λ [b] (if b.is_focused "bold" nil))})

(def- modified-state
  {:text (λ [b] (if b.is_modified " ●" ""))
   :fg (λ [b] (if b.is_focused selected-modified-state default-modified-state))})

(cokeline.setup
  {:components [padding something name modified-state padding]
   :show_if_buffers_are_at_least 1
   :mappings {:cycle_prev_next true}
   :default_hl {:fg foreground
                :bg background
                :style style}})
