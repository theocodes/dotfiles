;;; -*- lexical-binding: t; -*-

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package diff-hl
  :config
  (set-face-attribute 'diff-hl-insert nil :inherit nil :background "#468800" :foreground "#468800")
  (set-face-attribute 'diff-hl-change nil :inherit nil :background "#bda900" :foreground "#bda900")
  (set-face-attribute 'diff-hl-delete nil :inherit nil :background "#FF5E5E" :foreground "#FF5E5E")
  (global-diff-hl-mode)
  (diff-hl-margin-mode))

;; highlight matching parens
(show-paren-mode 1)

;; enable multiedit with evil keys
(use-package evil-multiedit
  :config
  (evil-multiedit-default-keybinds))

;; commenting
(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; enable emmet on web-mode
(add-hook 'web-mode-hook 'emmet-mode)

;; automatic parens pairing
(electric-pair-mode 1)

(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode 1))

;; use system clipboard
(use-package xclip
  :config
  (xclip-mode 1))

(use-package undo-tree
  :config
  (global-undo-tree-mode 1))

(use-package flycheck)

(use-package evil-terminal-cursor-changer
  :config
  (unless (display-graphic-p)
          (require 'evil-terminal-cursor-changer)
          (evil-terminal-cursor-changer-activate)))

(use-package corfu
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)      ;; Preselect the prompt
  (corfu-scroll-margin 5)        ;; Use scroll margin
  :init
  (global-corfu-mode))

(use-package corfu-terminal
  :after corfu
  :init
  (corfu-terminal-mode))


(use-package kind-icon
    :after corfu
    :config
    (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package editorconfig
  :config
  (editorconfig-mode 1))
