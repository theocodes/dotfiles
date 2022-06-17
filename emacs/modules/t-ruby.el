;;; t-ruby.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'ruby-mode)
(straight-use-package 'haml-mode)
(straight-use-package 'yaml-mode)

(setq ruby-insert-encoding-magic-comment nil)

;; (add-hook ruby-mode-hook 'eglot)

(provide 't-ruby)
