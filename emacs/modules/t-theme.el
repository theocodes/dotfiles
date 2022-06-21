;;; t-theme.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'modus-themes)
(straight-use-package 'doom-themes)

;; Load package
(require 'modus-themes)

;; Customizations
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-org-blocks 'gray-background
      modus-themes-subtle-line-numbers t
      modus-themes-paren-match '(bold intense)
      modus-themes-mode-line '(accented borderless (padding . 2) (height . 0.9))
      modus-themes-completions '((matches . (extrabold))
                                 (selection . (semibold accented))
                                 (popup . (accented intense)))
      modus-themes-region '(bg-only no-extend))

;; Load theme files before enabling
(modus-themes-load-themes)

;; Load the theme of your choice
(modus-themes-load-vivendi) ;; OR (modus-themes-load-operandi)
;;(load-theme 'doom-horizon t)

;; Toggle dark/light
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

;; Init
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(provide 't-theme)
