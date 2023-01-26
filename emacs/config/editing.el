
;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; show changes from hit in the gutter
;;(require 'diff-hl)

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

;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; enable emmet on web-mode
(add-hook 'web-mode-hook 'emmet-mode)

;; show whitespace
;(setq-local show-trailing-whitespace t)
;(setq whitespace-style (quote (face spaces tabs space-mark tab-mark)))
;(global-whitespace-mode 1)

;; automatic parens pairing
(electric-pair-mode 1)

(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode 1))

(use-package undo-tree
  :config
  (global-undo-tree-mode 1))

(use-package flycheck)

(use-package evil-terminal-cursor-changer
  :config
  (unless (display-graphic-p)
          (require 'evil-terminal-cursor-changer)
          (evil-terminal-cursor-changer-activate)))
