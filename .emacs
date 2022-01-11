;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)

;; Proper config start

(setq use-package-always-ensure t) ; Auto-install with use-package
(setq inhibit-startup-message t)   ; No welcome buffer

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

(set-face-attribute 'default nil :font "FuraMono Nerd Font Mono" :height 140)
(load-theme 'wombat)

;; move custom stuff to its own file
(setq custom-file (concat user-emacs-directory "custom.el"))

;; set relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

;; sane defaults for evil
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; nicer modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; completion system
(use-package vertico
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)
	      ("C-f" . vertico-exit))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

;; completion history
(use-package savehist
  :init
  (savehist-mode))

;; completion info for results
(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; completion goodies
(use-package consult
  :bind (("C-s" . consult-line)))

(use-package consult-projectile)

;; it's magit!
(use-package magit)

;; manage projects
(use-package projectile)
