(setq deft-directory "~/Dropbox/notes/"
      deft-extensions '("md" "org" "txt")
      deft-default-extension "txt"
      deft-auto-save-interval 0
      deft-new-file-format "%Y%m%d%H%M"
      deft-strip-summary-regexp "^\\(?:\\(#\\+\\)?\\(?:filetags:\s+\\|tags:\s+\\|title:.*\\|identifier:.*\\|date:.*\\)\\|.*\\)"
      deft-window-width 200
      deft-time-format "%Y-%m-%d %H:%M"
      deft-recursive t)

(setq denote-directory (expand-file-name "~/Dropbox/notes/")
      denote-known-keywords '("journal")
      denote-file-type 'org)

(add-hook 'dired-mode-hook #'denote-dired-mode)
