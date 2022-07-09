;; setting fonts
(set-face-attribute 'default nil :font "Iosevka" :height 140 :weight 'regular)

;; load the team to use
(load-theme 'doom-badger t)

;; disable welcome screen
(setq inhibit-startup-message t)

;; tools buttons that makes this look like ms outlook
(tool-bar-mode -1)

;; no need to show scrollbar
(scroll-bar-mode -1)

;; disable file menu (ie File Edit etc..)
(menu-bar-mode -1)
