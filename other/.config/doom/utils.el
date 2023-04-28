;;; utils.el -*- lexical-binding: t; -*-

(defun denote-create-daily-note ()
  "Custom function to create a daily note in denote"
  (interactive)
  (denote (format-time-string "%a, %d %b %Y") '("journal")))

(defun t/close-thing ()
  "Custom function to close the split if exists or the buffer."
  (interactive)
  (if (= (length (window-list)) 1)
      (kill-current-buffer)
    (delete-window)))
