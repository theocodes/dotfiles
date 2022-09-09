;;; $DOOMDIR/windows.el -*- lexical-binding: t; -*-

(defun t/focused (buffer alist)
  "Action function to select a window in a chain of window operations."
  (select-window  (display-buffer-in-side-window buffer alist)))

(add-to-list 'display-buffer-alist
             '("\\*\\(Flymake diagnostics\\|Async Shell Command\\)"
               (t/focused)
               (side . bottom)
               (slot . 0)
               (window-height . 0.40)))

;; Shell mode starts in normal mode
(evil-set-initial-state 'shell-mode 'normal)
