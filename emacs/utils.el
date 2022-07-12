;;; -*- lexical-binding: t; -*-

;; Helper functions

(defun t/denote-search-note ()
  "Search for notes in denote directory."
  (interactive)
  (consult-find (denote-directory)))

;; (defun t/denote-create-journal-entry ()
;;   "Creates a journal entry note that will go in the 'journal/' directory within
;; `denote-directory'. The directory will be created on the fly if it doesn't yet exist."
;;   (interactive)
;;   (let* ((date (shell-command-to-string (concat "echo -n $(date +%Y/%B/%d/%A)")))
;;          (parts (split-string date "/"))
;;          (year (car parts))
;;          (month (car (cdr parts)))
;;          (day (car (cdr (cdr parts))))
;;          (day-of-week (car (cdr (cdr (cdr parts)))))
;;          (directory (concat denote-directory "journal/")))
         
;;     (shell-command (concat "mkdir -p " directory))
;;     (denote-subdirectory directory (format "%s, %s %s %s" day-of-week day month year) '("journal"))))

;; (denote-subdirectory (concat denote-directory "journal") "Journal Entry" '("journal"))

(defun t/switch-to-perspective-one ()
  "Switches to whichever the first perspective is."
  (interactive)
  (persp-switch-by-number 1)
  (message "Switched to '%s' perspective" (persp-current-name)))

(defun t/switch-to-perspective-two ()
  "Switches to whichever the second perspective is."
  (interactive)
  (persp-switch-by-number 2)
  (message "Switched to '%s' perspective" (persp-current-name)))

(defun t/switch-to-perspective-three ()
  "Switches to whichever the third perspective is."
  (interactive)
  (persp-switch-by-number 3)
  (message "Switched to '%s' perspective" (persp-current-name)))

(defun t/describe-thing-at-point ()
  "Describes thing at point.
The order of inspection is as follows:
  - Attempt to describe as an elisp symbol
  - Hand over to lsp (TODO)"
  (interactive)
  (let ((thing (symbol-at-point)))
    (help-xref-interned thing)))

(defun t/eshell-toggle ()
  "Toggle an full-sized eshell instance in the context of current project."
  (interactive)
  (if (string= (buffer-name) (concat "*eshell " (projectile-project-name) "*"))
      (evil-switch-to-windows-last-buffer)
    (projectile-run-eshell)))

(defun t/eshell-popup-toggle ()
  "Toggle a popup eshell instance in the context of current project."
  (interactive)
  (let* ((name (concat "*eshell " (projectile-project-name) " popup*"))
         (buf (get-buffer name)))
    (if buf
        (if (string= (buffer-name buf) (buffer-name))
            (popper-toggle-latest)
          (display-buffer name))
      (with-current-buffer (projectile-run-eshell)
        (rename-buffer name)))))

(defun t/vterm-toggle ()
  "Toggle an full-sized vterm instance in the context of current project."
  (interactive)
  (if (string= (buffer-name) (concat "*vterm " (projectile-project-name) "*"))
      (evil-switch-to-windows-last-buffer)
    (projectile-run-vterm)))

(defun t/vterm-popup-toggle ()
  "Toggle a popup vterm instance in the context of current project."
  (interactive)
  (let* ((name (concat "*vterm " (projectile-project-name) " popup*"))
         (buf (get-buffer name)))
    (if buf
        (if (string= (buffer-name buf) (buffer-name))
	    (popper-toggle-latest)
          (display-buffer name))
      (with-current-buffer (projectile-run-vterm name)
        (rename-buffer name)))))
