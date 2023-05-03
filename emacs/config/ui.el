;; setting fonts (GUI only)
(set-face-attribute 'default nil :font "Comic Mono" :height 130 :weight 'regular)

;; disable welcome screen
(setq inhibit-startup-message t)

;; tools buttons that makes this look like ms outlook (GUI only)
(tool-bar-mode -1)

;; no need to show scrollbar
(scroll-bar-mode -1)

;; disable file menu (ie File Edit etc..)
(menu-bar-mode -1)

;; set theme
(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;; remove background color on tty
(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))

(on-frame-open)

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

(use-package doom-modeline
  :config
  (doom-modeline-mode 1))

;; Change the format of the window frame title
(setq frame-title-format "%b - Emacs")

(use-package highlight-indent-guides
  :custom
  (highlight-indent-guides-method 'bitmap)
  ;; (highlight-indent-guides-suppress-auto-error t)
  ;; (highlight-indent-guides-responsive 'stack)
  (highlight-indent-guides-delay 0)
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))
