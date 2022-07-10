;; packages to install
(setq packages
  '(
    use-package evil evil-collection evil-commentary evil-multiedit
    undo-tree doom-themes centaur-tabs all-the-icons helpful general
    which-key exec-path-from-shell xclip consult embark embark-consult
    marginalia orderless vertico company perspective org org-bullets
    org-roam org-appear magit projectile denote markdown-mode modus-themes
    eshell-git-prompt pulsar counsel diff-hl git-gutter))

;; modules to load
(setq modules
  '(
    ;; top level
    "utils"
    "straight"

    ;; configure and load modes
    "config/modes/evil"
    "config/modes/centaur-tabs"
    "config/modes/org"

    ;; everything else
    "config/defaults"
    "config/ui"
    "config/completion"
    "config/editing"
    "config/notes"
    "config/keybindings"
    "config/shells"))

;; load modules
(dolist (x modules)
  (load (concat config-dir x)))
