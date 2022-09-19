;;; $DOOMDIR/utils.el -*- lexical-binding: t; -*-

;; Note taking

(defun theocodes/denote-new-journal ()
    "Create a new journal denote note."
  (interactive)
  (let ((test "hello"))
   (message test)))

(defun theocodes/denote-notes ()
  "Open notes directory in Dired."
  (interactive)
  (dired "~/Dropbox/notes/"))

(defun theocodes/denote-find-file ()
  "Search for notes in denote directory."
  (interactive)
  (cd "~/Dropbox/notes")
  (call-interactively 'find-file))

;; Running tests

(defun theocodes/rspec-file ()
  (interactive)
  (let* ((filename (buffer-file-name))
         (cmd (format "rspec %s" filename)))
    (projectile-run-async-shell-command-in-root cmd)))

(defun theocodes/rspec-spec ()
  (interactive)
  (let* ((filename (buffer-file-name))
         (line (line-number-at-pos))
         (cmd (format "rspec %s:%s" filename line)))
    (projectile-run-async-shell-command-in-root cmd)))

;; Window management

(defun theocodes/split-window ()
  "Horizontally splits window and focus new split"
  (interactive)
  (evil-window-split)
  (other-window 1))

(defun theocodes/vsplit-window ()
  "Vertically splits window and focus new split"
  (interactive)
  (evil-window-vsplit)
  (other-window 1))

(defun theocodes/dwim-delete-window ()
  "Closes a split window or tab."
  (interactive)
  (cond ((> (length (window-list)) 1) (delete-window))
        (t (kill-current-buffer))))

;; Shell emulators

(defun theocodes/eshell-toggle ()
  "Toggle an full-sized eshell instance in the context of current project."
  (interactive)
  (if (string= (buffer-name) (concat "*eshell " (projectile-project-name) "*"))
      (evil-switch-to-windows-last-buffer)
    (projectile-run-eshell)))

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
