(local fzf (require :fzf-lua))

(fzf.setup
  {:git {:files {:git_icons false :file_icons false}}
   :winopts {:border "none"
             :fullscreen true
             :preview {:vertical "up:80%" :layout "vertical"}}})
