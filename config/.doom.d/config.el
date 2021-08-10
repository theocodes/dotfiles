;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; used by gpg, magit etc
(setq user-full-name "Theo Felippe"
      user-mail-address "public@theocodes.com")

;; fonts
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; theme
(setq doom-theme 'doom-molokai)

;; where to store org files
(setq org-directory "~/org/")

;; relative line numbers
(setq display-line-numbers-type 'relative)

;; fuzzy find in buffer with ctrl-s
(map! [remap isearch-forward] 'swiper)

;; paste with Ctrl-Shift-v
(map! :g "C-S-v" #'yank)

;; find file with ctrl-p
(map! [remap evil-paste-pop] #'projectile-find-file)

;; switch to previous buffer with SPC-TAB
(map! :leader "TAB" #'evil-switch-to-windows-last-buffer)
