;;; t-defaults.el -*- lexical-binding: t; -*-

;; Install packages
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'xclip)

;; Make emacs load system PATH when launching via GUI
(when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

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

;; Move custom away from init.el
(setq custom-file "~/.emacs.d/custom.el")

;; init
(xclip-mode 1) ;; copy to system clipboard (x-plat)

(provide 't-defaults)
