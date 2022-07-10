;;; -*- lexical-binding: t; -*-

;; Helper functions

(defun t/denote-search-note ()
  "Search for notes in denote directory."
  (interactive)
  (consult-find (denote-directory)))

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
