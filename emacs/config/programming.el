;; LSP

;; (use-package lsp
;;   :init
;;   (setq lsp-keymap-prefix "C-c l"
;;         lsp-headerline-breadcrumb-enable nil))

;; (use-package lsp-ui
;;   :init
;;   (setq lsp-ui-sideline-show-hover nil))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package magit
  :commands magit-status
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Ruby

;; (use-package ruby-mode
;;   :init
;;   (setq ruby-insert-encoding-magic-comment nil)
;;   :config
;;   (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
;;   (add-hook 'ruby-mode-hook 'lsp))

;; Javascript

(setq web-mode-code-indent-offset 2
      web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      tab-width 2
      js-indent-level 2
      css-indent-offset 2)
