;; -*- lexical-binding: t; -*-

;; Window management

(defun theocodes/dwim-delete-window ()
  "Closes a split window or tab."
  (interactive)
  (cond ((> (length (window-list)) 1) (delete-window))
        (t (kill-current-buffer))))

(defun theocodes/eshell-popup-toggle ()
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

(defun theocodes/eshell-toggle ()
  "Toggle an full-sized eshell instance in the context of current project."
  (interactive)
  (if (string= (buffer-name) (concat "*eshell " (projectile-project-name) "*"))
      (evil-switch-to-windows-last-buffer)
    (projectile-run-eshell)))

(defun theocodes/vterm-toggle ()
  "Toggle an full-sized vterm instance in the context of current project."
  (interactive)
  (if (string= (buffer-name) (concat "*vterm " (projectile-project-name) "*"))
      (evil-switch-to-windows-last-buffer)
    (projectile-run-vterm)))

(defun theocodes/vterm-popup-toggle ()
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

(defun theocodes/open-vterm-tab ()
  "Opens a new tab and instantiate a vterm session at projectile root."
  (interactive)
  (tab-new)
  (projectile-run-vterm))
(defun theocodes/rspec-file ()
  (interactive)
  (let* ((filename (buffer-file-name))
         (cmd (format "rspec %s" filename)))
    (projectile-run-async-shell-command-in-root cmd)))

;; Running tests

(defun theocodes/rspec-spec ()
  (interactive)
  (let* ((filename (buffer-file-name))
         (line (line-number-at-pos))
         (cmd (format "rspec %s:%s" filename line)))
    (projectile-run-async-shell-command-in-root cmd)))

(defun theocodes/switch-to-perspective-by-number (n)
  "Switches to whichever the 'n' perspective is."
  (interactive)
  (persp-switch-by-number n)
  (message "Switched to '%s' perspective" (persp-current-name)))

;; Notes

(defun theocodes/notes-dired ()
  (interactive)
  (dired "~/Dropbox/notes"))

(defun theocodes/notes-find ()
  (interactive)
  (consult-find "~/Dropbox/notes/"))

;; Misc

(defun theocodes/describe-thing-at-point ()
  "Describes thing at point.
The order of inspection is as follows:
  - Attempt to describe as an elisp symbol
  - Hand over to lsp if enabled"
  (interactive)
  (let ((thing (symbol-at-point)))
    (if (and (boundp 'lsp-mode) lsp-mode)
        (lsp-describe-thing-at-point)
        (help-xref-interned thing))))

