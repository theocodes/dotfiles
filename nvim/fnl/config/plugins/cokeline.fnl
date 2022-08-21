(local cokeline (require :cokeline))
(local utils (require "cokeline/utils"))
(local get-hex utils.get_hex)

(local default-foreground (get-hex "Comment" "fg"))
(local selected-foreground "White")
(local default-background "NONE")
(local selected-background "#3f33af")
(local default-modified-state nil)
(local selected-modified-state "White")

(local foreground
     (λ [buffer]
       (if buffer.is_focused selected-foreground default-foreground)))

(local background
     (λ [buffer]
       (if buffer.is_focused selected-background default-background)))

(local style
     (λ [buffer]
       (if buffer.is_focused "bold" nil)))

(local padding
  {:text " "})

(local something
  {:text (λ [b] b.unique_prefix)
   :fg (λ [b] (if b.is_focused (get-hex "Normal" "fg") (get-hex "Comment" "fg")))
   :style "italic"})

(local name
  {:text (λ [b] b.filename)
   :style (λ [b] (if b.is_focused "bold" nil))})

(local modified-state
  {:text (λ [b] (if b.is_modified " ●" ""))
   :fg (λ [b] (if b.is_focused selected-modified-state default-modified-state))})

(cokeline.setup
  {:components [padding something name modified-state padding]
   :show_if_buffers_are_at_least 1
   :mappings {:cycle_prev_next true}
   :default_hl {:fg foreground
                :bg background
                :style style}})
