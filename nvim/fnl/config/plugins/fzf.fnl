(local fzf (require :fzf-lua))

(fzf.setup
  {:git {:files {:file_icons false :git_icons false}}
   :winopts {:border "single"
             :fullscreen true
             :preview {:vertical "up:80%"
                       :layout "vertical"}}})
