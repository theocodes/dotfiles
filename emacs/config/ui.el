;; setting fonts (GUI only)
(set-face-attribute 'default nil :font "Iosevka Comfy" :height 160 :weight 'regular)

;; disable welcome screen
(setq inhibit-startup-message t)

;; tools buttons that makes this look like ms outlook (GUI only)
(tool-bar-mode -1)

;; no need to show scrollbar
(scroll-bar-mode -1)

;; disable file menu (ie File Edit etc..)
(menu-bar-mode -1)

(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;; (use-package doom-themes
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-molokai t))

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))

;; (defun on-after-init ()
;;   (unless (display-graphic-p (selected-frame))
;;     (set-face-background 'default "unspecified-bg" (selected-frame))))

;; (add-hook 'window-setup-hook 'on-after-init)

;; remove background color on tty
(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))

(add-hook 'after-make-frame-functions 'on-frame-open)

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

;; customize modeline
(set-face-background 'mode-line "unspecified-bg")
(set-face-background 'mode-line-inactive "unspecified-bg")
(set-face-background 'mode-line-buffer-id "unspecified-bg")
(setq column-number-mode t) ;; show both line and column numbers
