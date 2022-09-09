;;; $DOOMDIR/utils.el -*- lexical-binding: t; -*-

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
  (if (= (length (window-list)) 1)
      (tab-close)
    (delete-window)))

(defun theocodes/denote-search-note ()
  "Search for notes in denote directory."
  (interactive)
  (consult-find (denote-directory)))

(defun theocodes/select-tab (n)
  "Switches to the 'n' tab."
  (interactive)
  (tab-bar-select-tab n))

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

(defun theocodes/open-vterm-tab ()
  "Opens a new tab and instantiate a vterm session at projectile root."
  (interactive)
  (tab-new)
  (projectile-run-vterm))
