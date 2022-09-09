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

(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;; set background opacity
(set-frame-parameter (selected-frame) 'alpha '(99 . 99))
(add-to-list 'default-frame-alist '(alpha . (99 . 99)))

;; relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

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
