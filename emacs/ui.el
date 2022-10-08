;; -*- lexical-binding: t; -*-

;(use-package gruber-darker-theme
;  :config (load-theme 'gruber-darker t))

(use-package ef-themes
  :config (load-theme 'ef-dark t))

;; (use-package doom-modeline
;;   :init (setq doom-modeline-lsp t)
;;   :config (doom-modeline-mode 1))

(use-package all-the-icons)

;; set transparent background on tty mode
(unless (display-graphic-p (selected-frame))
  (set-face-background 'default "unspecified-bg" (selected-frame)))
