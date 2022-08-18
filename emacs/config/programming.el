;; LSP

(setq lsp-keymap-prefix "C-c l"
      lsp-headerline-breadcrumb-enable nil
      lsp-ui-sideline-show-hover nil)

;; Ruby

(setq ruby-insert-encoding-magic-comment nil)

;; load inf-ruby alongside ruby-mode
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'lsp)

;; Javascript

(setq js-indent-level 2)
