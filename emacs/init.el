;;; -*- lexical-binding: t; -*-

;; Modules to load
(setq modules
      '("bootstrap"
	"utils"
	"defaults"
        "keybindings"
	"completion"
        "autocompletion"
	"projects"
        "editing"
        "programming"
	"windows"
        "shells"
        "notes"
        "ui"))

;; Load modules
(dolist (x modules)
  (load (concat config-dir x)))
