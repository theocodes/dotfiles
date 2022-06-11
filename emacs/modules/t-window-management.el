;;; t-window-management.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'popper)

(defun t/active-side-window (buffer alist)
  (select-window  (display-buffer-in-side-window buffer alist)))

(add-to-list 'display-buffer-alist
             '("\\*rspec-compilation\\*"
               (t/active-side-window)
               (side . right)
               (window-width . 0.8)))

(add-to-list 'display-buffer-alist
	     '("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|[Hh]elp\\|Messages\\)\\*"
	       (t/active-side-window)
               (side . bottom)
               (slot . 0)
               (window-height . 0.25)))

(add-to-list 'display-buffer-alist
	     '("\\*helpful"
	       (t/active-side-window)
               (side . bottom)
               (slot . 0)
               (window-height . 0.25)))

;; All buffers ending in "popup*" take 30% of the
;; bottom of the screen.
(add-to-list 'display-buffer-alist
             '("popup\\*$"
               (t/active-side-window)
               (side . bottom)
               (slot . -1)
               (window-height . 0.40)))

;; popper
(require 'popper)

(setq popper-mode-line t
      popper-reference-buffers '("popup\\*$")
      popper-display-control 'user)

(define-key popper-mode-map (kbd "C-.") 'popper-toggle-latest)
(define-key popper-mode-map (kbd "M-`") 'popper-cycle)
(define-key popper-mode-map (kbd "C-M-`") 'popper-toggle-type)

(popper-mode +1)
(popper-echo-mode +1)

(provide 't-window-management)
