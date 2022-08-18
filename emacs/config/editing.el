;; relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; configure and load company
(setq company-idle-delay 0
      company-minimum-prefix-length 3
      company-selection-wrap-around t
      company-backends '((company-capf company-dabbrev-code)))

(add-hook 'after-init-hook 'global-company-mode)

(company-tng-configure-default)

;; indent with spaces
(setq-default indent-tabs-mode nil)

;; delete trailing whitespace
(add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)

;; load perspective
(setq persp-mode-prefix-key "")
(persp-mode)

;; set projectile project search path
(when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))

(projectile-global-mode +1)

;; find the cursor
(pulsar-global-mode 1)

;; show changes from hit in the gutter
(require 'diff-hl)
(set-face-attribute 'diff-hl-insert nil :inherit nil :background "#468800" :foreground "#468800")
(set-face-attribute 'diff-hl-change nil :inherit nil :background "#bda900" :foreground "#bda900")
(set-face-attribute 'diff-hl-delete nil :inherit nil :background "#FF5E5E" :foreground "#FF5E5E")

(global-diff-hl-mode)

;; highlight matching parens
(show-paren-mode 1)

;; enable multiedit with evil keys
(require 'evil-multiedit)
(evil-multiedit-default-keybinds)

(setq web-mode-code-indent-offset 2
      web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      tab-width 2
      css-indent-offset 2)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; enable emmet on web-mode
(add-hook 'web-mode-hook 'emmet-mode)

(setq-local show-trailing-whitespace t)

;; show whitespace
;;(setq whitespace-style (quote (face spaces tabs space-mark tab-mark)))
;;(global-whitespace-mode 1)

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; configuring indentation lines
;; (setq highlight-indentation-blank-lines t)

(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; (require 'highlight-indentation)
;; (set-face-attribute 'highlight-indentation-current-column-face nil :background "#1e1e1e")
;; (set-face-attribute 'highlight-indentation-face nil :background "#090a09")

;; (add-hook 'prog-mode-hook 'highlight-indentation-mode)
;; (add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)

;; enable parinfer on lisps
;; (require 'parinfer-rust-mode)
;; (add-hook 'emacs-lisp-mode 'parinfer-rust-mode)

;; automatic parens pairing
;; (electric-pair-mode 1)
(rainbow-delimiters-mode 1)
