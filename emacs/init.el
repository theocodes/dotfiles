;;; -*- lexical-binding: t; -*-

;; Packages to install

(setq packages
      '(use-package
         evil
         evil-collection
         evil-commentary
         evil-multiedit
         undo-tree
         all-the-icons
         helpful
         general
         which-key
         exec-path-from-shell
         consult
         embark
         embark-consult
         marginalia
         orderless
         vertico
         company
         perspective
         org
         org-bullets
         org-roam
         org-appear
         magit
         projectile
         denote
         markdown-mode
         modus-themes
         pulsar
         web-mode
         haml-mode
         emmet-mode
         ;; highlight-indent-guides
         highlight-indentation
         terraform-mode
         diff-hl
         git-gutter
         deft
         popper
         avy
         vterm
         eshell-git-prompt
         inf-ruby
         haml-mode
         lsp-mode
         lsp-ui
         parinfer-rust-mode
         counsel))

;; Modules to load

(setq modules
      '("straight"
        "utils"

        "config/modes/evil"
        "config/modes/org"

        "config/defaults"
        "config/ui"
        "config/editing"
        "config/completion"
        "config/windows"
        "config/notes"
        "config/shells"
        "config/programming"
        "config/keybindings"))

;; Load modules

(dolist (x modules)
  (load (concat config-dir x)))
