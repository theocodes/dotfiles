;;; t-golang.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'go-mode)

(setq gofmt-command "goimports")

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (setq tab-width 4)))

(provide 't-golang)
