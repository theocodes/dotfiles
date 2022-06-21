;;; t-editing.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'git-gutter)
(straight-use-package 'projectile)
(straight-use-package 'perspective)

(require 'perspective)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; cleanup whitespace
(customize-set-variable 'whitespace-action '(cleanup auto-cleanup))

;; parentheses
(electric-pair-mode 1) ; auto-insert matching bracket
(show-paren-mode 1)    ; turn on paren match highlighting

(require 'git-gutter)
(customize-set-variable 'git-gutter:modified-sign " ")
(customize-set-variable 'git-gutter:added-sign " ")
(customize-set-variable 'git-gutter:deleted-sign " ")

(global-git-gutter-mode +1)

;; projectile
(when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))

;; Init

(projectile-global-mode +1)
(persp-mode)

(provide 't-editing)
