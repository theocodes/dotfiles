;;; -*- lexical-binding: t; -*-

;; Modules to load
(setq modules
      '("bootstrap"
        "utils"
        "config/modes/evil"
        "config/modes/org"
        "config/defaults"
        "config/ui"
        "config/editing"
        "config/completion"
        "config/projects"
        "config/windows"
        "config/programming"
        "config/keybindings"))

;; Load modules
(dolist (x modules)
  (load (concat config-dir x)))

(set-face-background 'default "unspecified-bg" (selected-frame))

(when (theocodes/executable-find "win32yank.exe")
  (setq interprogram-cut-function 'wsl-copy)
  (setq interprogram-paste-function 'wsl-paste))
