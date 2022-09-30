;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Theo Felippe"
      user-mail-address "git@theocodes.com")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(use-package! projectile
  :init
  (when (file-directory-p "~/Code")
      (setq projectile-project-search-path '("~/Code"))))

(after! denote
  (setq denote-directory (expand-file-name "~/Dropbox/notes/")
        denote-file-type 'txt
        denote-known-keywords '("journal" "emacs" "easol")))

(add-hook 'dired-mode-hook #'denote-dired-mode)

(load! "defaults.el")
(load! "utils.el")
(load! "keybindings.el")
(load! "ui.el")
(load! "windows.el")
