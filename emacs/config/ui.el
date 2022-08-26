;; setting fonts
(set-face-attribute 'default nil :font "Iosevka Comfy" :height 160 :weight 'regular)

;; disable welcome screen
(setq inhibit-startup-message t)

;; tools buttons that makes this look like ms outlook
(tool-bar-mode -1)

;; no need to show scrollbar
(scroll-bar-mode -1)

;; disable file menu (ie File Edit etc..)
(menu-bar-mode -1)

(setq tab-bar-new-tab-choice nil
      tab-bar-close-button-show nil
      tab-bar-new-button-show nil)

;(tab-bar-mode 1)
;; (global-tab-line-mode 1)

;; sidebar explorer

(defun custom-awesome-tab-hide-tab (x)
  (let ((name (format "%s" x)))
    (or
     (string-suffix-p "popup*" name)
     (string-prefix-p "*epc" name)
     (string-prefix-p "*vterm" name)
     (string-prefix-p "*eshell" name)
     (string-prefix-p "*Async Shell Command" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*Messages" name)
     (string-prefix-p "*straight-process" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (and (string-prefix-p "magit" name)
               (not (file-name-extension name)))
     )))

(setq awesome-tab-cycle-scope 'tabs
      awesome-tab-hide-tab-function 'custom-awesome-tab-hide-tab)

(awesome-tab-mode t)

;; start modeline
(doom-modeline-mode 1)

;; modus themes customizations
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-org-blocks 'gray-background
      modus-themes-subtle-line-numbers t
      modus-themes-mode-line '(accented borderless)
      modus-themes-paren-match '(bold intense)
      modus-themes-completions '((matches . (extrabold))
                                 (selection . (semibold accented))
                                 (popup . (accented intense)))
      modus-themes-region '(bg-only no-extend))

;; Load theme files before enabling
(modus-themes-load-themes)

;; Load the theme of your choice
(modus-themes-load-vivendi)
;; (modus-themes-load-operandi)
;; (load-theme 'wombat t)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;; set background opacity
(set-frame-parameter (selected-frame) 'alpha '(99 . 99))
(add-to-list 'default-frame-alist '(alpha . (99 . 99)))

(defun override-tabs-styles ()
  "Resets tabs styles"
  (interactive)

  (set-face-attribute 'modus-themes-tab-backdrop nil :inherit nil :background nil :foreground nil )

  (set-face-attribute 'tab-bar nil :background nil :foreground nil :box '(:line-width 4 :color "#0000000" :alpha 0) :inherit nil)
  (set-face-attribute 'tab-bar-tab nil :background nil :foreground (face-attribute 'font-lock-keyword-face :foreground) :box nil :inherit nil)
  (set-face-attribute 'tab-bar-tab-inactive nil :background nil :foreground "#282828" :box nil :inherit nil)
  (set-face-attribute 'tab-bar-tab-group-current nil :background nil :foreground nil :box nil)
  (set-face-attribute 'tab-bar-tab-group-inactive nil :background nil :foreground nil :box nil))

(override-tabs-styles)

;; Toggle dark/light
(define-key global-map (kbd "<f5>") (lambda () (interactive) (modus-themes-toggle) (override-tabs-styles)))

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                treemacs-mode-hook
                neotree-mode-hook
                vterm-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
