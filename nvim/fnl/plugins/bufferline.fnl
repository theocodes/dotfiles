(local bufferline (require :bufferline))

(fn set-highlight [group rules]
  (vim.api.nvim_set_hl 0 group rules))

(fn get-highlight [group]
  (vim.api.nvim_get_hl_by_name group true))

(bufferline.setup
  {:options {:show_buffer_close_icons false
             :show_buffer_icons false
             :show_tab_indicators true
             :show_modified_icon false
             :show_duplicate_prefix false
             :separator_style "thin"
             :name_formatter (lambda [buf] (.. " " buf.name))
             :max_name_length 20
             :diagnostics "nvim_lsp"
             :tab_size 0
             :indicator {:icon "▎" :style "icon"}}})

(set-highlight "BufferlineFill" {:bg "NONE"})
(set-highlight "BufferlineBufferSelected" {:bg "NONE" :italic false :bold true})

(local primary (get-highlight "String"))

(local hint (get-highlight "BufferlineHintSelected"))
(set-highlight "BufferlineHintSelected" {:fg hint.foreground :bg "NONE" :italic false :bold true})

(local err (get-highlight "BufferlineErrorSelected"))
(set-highlight "BufferlineErrorSelected" {:fg err.foreground :bg "NONE" :italic false :bold true})

(local war (get-highlight "BufferlineWarningSelected"))
(set-highlight "BufferlineWarningSelected" {:fg war.foreground :bg "NONE" :italic false :bold true})
