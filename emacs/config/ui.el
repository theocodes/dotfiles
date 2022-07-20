;; setting fonts
(set-face-attribute 'default nil :font "Iosevka Comfy" :height 120 :weight 'regular)

;; load the team to use
;; (load-theme 'doom-badger t)

;; disable welcome screen
(setq inhibit-startup-message t)

;; tools buttons that makes this look like ms outlook
(tool-bar-mode -1)

;; no need to show scrollbar
(scroll-bar-mode -1)

;; disable file menu (ie File Edit etc..)
(menu-bar-mode -1)

;; modus themes customizations
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
;; (modus-themes-load-vivendi) ;; OR (modus-themes-load-operandi)
(load-theme 'doom-xcode t)

;; Toggle dark/light
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;; set background opacity
(set-frame-parameter (selected-frame) 'alpha '(99 . 99))
(add-to-list 'default-frame-alist '(alpha . (99 . 99)))
