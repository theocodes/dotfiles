;; -*- lexical-binding: t; -*-

(use-package gruber-darker-theme)

(use-package ef-themes
  :config (load-theme 'ef-dark t))

(use-package doom-modeline
  :init (setq doom-modeline-lsp t)
  :config (doom-modeline-mode 1))

(use-package all-the-icons)
