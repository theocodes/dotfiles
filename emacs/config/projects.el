;;; -*- lexical-binding: t; -*-

(use-package projectile
  :init
  (when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))
  :config
  (projectile-global-mode +1))
