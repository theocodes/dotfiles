(defun t/denote-search-note ()
  "Search for notes in denote directory."
  (interactive)
  (consult-find (denote-directory)))

(defun t/load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (t/load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

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
