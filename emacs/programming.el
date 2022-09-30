;; -*- lexical-binding: t; -*-

(defun efs/lsp-mode-setup ()
  (setq lsp-ui-sideline-show-diagnostics t
        lsp-enable-symbol-highlighting t
        lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor nil
        lsp-ui-doc-show-with-mouse nil
        lsp-lens-enable t
        lsp-headerline-breadcrumb-enable nil
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-hover t
        lsp-modeline-code-actions-enable t
        lsp-diagnostics-provider 'flycheck
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t
        lsp-eldoc-enable-hover t
        lsp-modeline-diagnostics-enable t
        lsp-signature-auto-activate t
        lsp-signature-render-documentation t
        lsp-completion-provider 'completion-at-point
        lsp-completion-show-detail t
        lsp-completion-show-kind t))

(use-package flycheck
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
  (global-flycheck-mode))

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
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-position 'bottom))

(use-package magit
  :commands magit-status
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Ruby

(use-package inf-ruby)

(use-package ruby-mode
  :init
  (setq ruby-insert-encoding-magic-comment nil)
  :config
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'ruby-mode-hook 'lsp))

;; Javascript

(setq web-mode-code-indent-offset 2
      web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      tab-width 2
      js-indent-level 2
      css-indent-offset 2)

