;;; -*- lexical-binding: t; -*-

;; Configuration of how windows should behave.

(defun t/focused (buffer alist)
  "Action function to select a window in a chain of window operations."
  (select-window  (display-buffer-in-side-window buffer alist)))

(add-to-list 'display-buffer-alist
             '("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|[Hh]elp\\|Messages\\)\\*"
               (t/focused)
               (side . bottom)
               (slot . 0)
               (window-height . 0.25)))

(add-to-list 'display-buffer-alist
             '("popup\\*$"
               (t/focused)
               (side . bottom)
               (slot . -1)
               (window-height . 0.40)))

;; Load popper

(require 'popper)

;; (setq popper-reference-buffers
;;       '("\\*Messages\\*"
;;         "Output\\*$"
;;         "\\*Async Shell Command\\*"
;;         help-mode
;;         compilation-mode))

(setq popper-mode-line t
      popper-display-control 'user)

(setq popper-reference-buffers
      '("popup\\*$"))

(global-set-key (kbd "C-`") 'popper-toggle-latest)  
(global-set-key (kbd "M-`") 'popper-cycle)
(global-set-key (kbd "C-M-`") 'popper-toggle-type)

(popper-mode 1)
