;;; -*- lexical-binding: t; -*-

;; Helper functions

(defun theocodes/neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

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

(defun theocodes/delete-window ()
  "Closes a split window or tab."
  (interactive)
  (if (= (length (window-list)) 1)
      (tab-close)
    (delete-window)))

(defun t/denote-search-note ()
  "Search for notes in denote directory."
  (interactive)
  (consult-find (denote-directory)))

(defun t/select-tab (n)
  "Switches to the 'n' tab."
  (interactive)
  (tab-bar-select-tab n))

(defun t/switch-to-perspective-by-number (n)
  "Switches to whichever the 'n' perspective is."
  (interactive)
  (persp-switch-by-number n)
  (message "Switched to '%s' perspective" (persp-current-name)))

(defun t/describe-thing-at-point ()
  "Describes thing at point.
The order of inspection is as follows:
  - Attempt to describe as an elisp symbol
  - Hand over to lsp if enabled"
  (interactive)
  (let ((thing (symbol-at-point)))
    (if (and (boundp 'lsp-mode) lsp-mode)
        (lsp-describe-thing-at-point)
        (help-xref-interned thing))))

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

(defun t/open-vterm-tab ()
  "Opens a new tab and instantiate a vterm session at projectile root."
  (interactive)
  (tab-new)
  (projectile-run-vterm))

(defun theocodes/executable-find (command)
  "Search for COMMAND in `exec-path' and return the absolute file name.
Return nil if COMMAND is not found anywhere in `exec-path'."
  ;; Use 1 rather than file-executable-p to better match the behavior of
  ;; call-process.
  (locate-file command exec-path exec-suffixes 1))

;; copy/paste on wsl

(setq wsl-copy-process nil)
(defun wsl-copy (text)
  (setq wsl-copy-process (make-process :name "win32yank.exe"
                                      :buffer nil
                                      :command '("win32yank.exe" "-i")
                                      :connection-type 'pipe))
  (process-send-string wsl-copy-process text)
  (process-send-eof wsl-copy-process))

(defun wsl-paste ()
  (if (and wsl-copy-process (process-live-p wsl-copy-process))
      nil ; should return nil if we're the current paste owner
    (let ((coding-system-for-read 'dos))
      (shell-command-to-string "win32yank.exe -o"))))
