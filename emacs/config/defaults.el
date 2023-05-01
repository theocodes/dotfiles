;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Make scrolling less stuttered
(setq auto-window-vscroll nil)
(customize-set-variable 'fast-but-imprecise-scrolling t)
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)
(customize-set-variable 'scroll-preserve-screen-position t)

;; Command is meta
(setq mac-command-modifier 'meta)

;; Better support for files with long lines
(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

;; Make shebang (#!) file executable when saved
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

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

(use-package no-littering)

;; disable bell noise
(setq ring-bell-function 'ignore)
