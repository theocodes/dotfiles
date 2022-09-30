
;; setting fonts
(set-face-attribute 'default nil :font "Iosevka Comfy" :height 160 :weight 'regular)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Command is meta
(setq mac-command-modifier 'meta)

;; Move backup files out of current directory
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

;; No lock files
(setq create-lockfiles nil)

;; Move undo files
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.undo")))

(add-hook 'after-init-hook #'recentf-mode)
(customize-set-variable 'recentf-save-file
                        (expand-file-name ".recentf" "~/.emacs.d/"))

;; Move custom away from .emacs
(setq custom-file "~/.emacs.d/custom.el")

;; magit
(setq-default with-editor-emacsclient-executable "emacsclient")
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

;; real maximise without gaps
(setq frame-resize-pixelwise t)

;; don't ask for confirmation if output buffer is taken
(setq async-shell-command-buffer 'new-buffer)

;; disable welcome screen
(setq inhibit-startup-message t)

;; tools buttons that makes this look like ms outlook
(tool-bar-mode -1)

;; no need to show scrollbar
(scroll-bar-mode -1)

;; disable file menu (ie File Edit etc..)
(menu-bar-mode -1)

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

;; set background opacity
(set-frame-parameter (selected-frame) 'alpha '(99 . 99))
(add-to-list 'default-frame-alist '(alpha . (99 . 99)))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(use-package no-littering)

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))
