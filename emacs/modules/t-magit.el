;;; t-magit.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'magit)

(setq-default with-editor-emacsclient-executable "emacsclient")
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

(provide 't-magit)
