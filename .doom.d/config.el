;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Theo Felippe"
      user-mail-address "public@theocodes.com")

;; general configuration
(setq ;;doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16 :weight 'semi-light)
      doom-theme 'doom-molokai
      org-directory "~/org/"
      display-line-numbers-type 'relative)

;; override keybindings

;; fuzzy find in buffer with ctrl-s
(map! [remap isearch-forward] '+default/search-buffer)

;; find file with ctrl-p
(map! [remap evil-paste-pop] #'projectile-find-file)

;; switch to previous buffer with SPC-TAB
(map! :leader "TAB" #'evil-switch-to-windows-last-buffer)

(map! :desc "toggle vterm popup" :nvi "s-i" #'+vterm/toggle)

;; start multiedit on selected text
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
