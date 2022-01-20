;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Theo Felippe"
      user-mail-address "git@theocodes.com")

(setq doom-font (font-spec :family "FuraMono Nerd Font Mono" :size 14 :weight 'medium)
      doom-theme 'doom-ir-black
      org-directory "~/org/"
      auth-sources '("~/.netrc")
      display-line-numbers-type 'relative)

;; fuzzy find in buffer with ctrl-s
(map! [remap isearch-forward] '+default/search-buffer)

(map! [remap evil-paste-pop] #'projectile-find-file)

(map! :leader "TAB" #'evil-switch-to-windows-last-buffer)

(map! :desc "toggle vterm popup" :nvi "s-i" #'+vterm/toggle)

(after! org
  (map! :map org-mode-map
        :n "C-h" 'org-promote-subtree
        :n "C-l" 'org-demote-subtree
        :n "C-j" 'org-move-subtree-down
        :n "C-k" 'org-move-subtree-up))

(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

(use-package! org-roam
  :custom
  (org-roam-directory "~/RoamNotes")
  (org-roam-completion-everywhere t))

(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.doom.d/snippets")))
