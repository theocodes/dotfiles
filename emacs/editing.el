;; -*- lexical-binding: t; -*-

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

(use-package undo-tree
  :config
  (global-undo-tree-mode 1))

(use-package evil-multiedit
  :config
  (evil-multiedit-default-keybinds))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; display column number
(column-number-mode 1)

;; automatic parens pairing
(electric-pair-mode 1)

(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode 1))

(use-package avy)
