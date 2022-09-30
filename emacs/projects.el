;; -*- lexical-binding: t; -*-

(use-package projectile
  :init
  (when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))
  :config
  (projectile-global-mode +1))

(use-package persp-mode
  :init
  (setq persp-autokill-buffer-on-remove t)
  :config
  (persp-mode))
