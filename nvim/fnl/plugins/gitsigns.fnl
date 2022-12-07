(local gitsigns (require :gitsigns))

(gitsigns.setup
  {:signcolumn true
   :numhl false
   :linehl false
   :word_diff false
   :watch_gitdir {:interval 1000 :follow_files true}
   :current_line_blame true
   :current_line_blame_opts {:delay 0 :virt_text true :virt_text_pos "right_align" :ignore_whitespace true}
   :current_line_blame_formatter_opts {:relative_time false}
   :current_line_blame_formatter "<summary> [<author>]"
   :update_debounce 100})
