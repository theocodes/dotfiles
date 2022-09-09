;;; -*- lexical-binding: t; -*-

;; Modules to load
(setq modules
      '("bootstrap"
        "utils"

        "config/modes/evil"
        ;; "config/modes/org"

        "config/defaults"
        "config/ui"
        "config/editing"
        "config/completion"
        "config/autocomplete"
        "config/projects"
        "config/windows"
        ;; "config/notes"
        ;; "config/shells"
        "config/programming"
        "config/keybindings"))

;; Load modules
(dolist (x modules)
  (load (concat config-dir x)))
