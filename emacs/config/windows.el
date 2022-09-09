;;; -*- lexical-binding: t; -*-

;; Configuration of how windows should behave.

(defun t/focused (buffer alist)
  "Action function to select a window in a chain of window operations."
  (select-window  (display-buffer-in-side-window buffer alist)))

(add-to-list 'display-buffer-alist
             '("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|[Hh]elp\\|lsp-help\\|Messages\\)\\*"
               (t/focused)
               (side . bottom)
               (slot . 0)
               (window-height . 0.25)))

(add-to-list 'display-buffer-alist
             '("\\*\\(Flymake diagnostics\\|Async Shell Command\\)"
               (t/focused)
               (side . bottom)
               (slot . 0)
               (window-height . 0.25)))

(add-to-list 'display-buffer-alist
             '("\\*\\(Async Shell Command\\)"
               (t/focused)
               (side . bottom)
               (slot . -1)
               (window-height . 0.40)))

(add-to-list 'display-buffer-alist
             '("popup\\*$"
               (t/focused)
               (side . bottom)
               (slot . -1)
               (window-height . 0.40)))

;; Load popper

(use-package popper
  :init
  (setq popper-mode-line t
        popper-display-control 'user
        popper-reference-buffers '("\\(Async Shell Command\\|popup\\)\\*$"))
  :config
  (global-set-key (kbd "C-`") 'popper-toggle-latest)
  (global-set-key (kbd "M-`") 'popper-cycle)
  (global-set-key (kbd "C-M-`") 'popper-toggle-type)

  (popper-mode 1))
