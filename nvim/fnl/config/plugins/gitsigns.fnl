(local gitsigns (require :gitsigns))

(gitsigns.setup
  {:signcolumn true
   :numhl false
   :linehl false
   :word_diff false
   :watch_gitdir { :interval 1000 :follow_files true}
   :current_line_blame true
   :current_line_blame_opts { :virt_text true :virt_text_pos "right_align" :delay 1000 :ignore_whitespace false}
   :current_line_blame_formatter_opts { :relative_time false}
   :update_debounce 100})

