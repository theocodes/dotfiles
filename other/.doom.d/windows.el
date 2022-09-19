;;; $DOOMDIR/windows.el -*- lexical-binding: t; -*-

;; Show async shell buffers as popups
(set-popup-rule! "\\*\\(Async Shell Command\\)" :select t :size 0.4 :side 'bottom :slot 0)

;; Async shell mode starts in normal mode
(evil-set-initial-state 'shell-mode 'normal)
