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
