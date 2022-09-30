;;; $DOOMDIR/defaults.el -*- lexical-binding: t; -*-

;; Disable usal macos menu (ie File, .. )
(menu-bar-mode 0)

;; don't ask for confirmation if output buffer is taken
(setq async-shell-command-buffer 'new-buffer)

;; set with-editor so magit doesn't cry
(setq-default with-editor-emacsclient-executable "emacsclient")
