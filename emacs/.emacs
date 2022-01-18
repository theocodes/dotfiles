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

;; paste with cmd-v
(global-set-key (kbd "M-v") 'clipboard-yank)

;; move saves out of the way
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

;; evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)

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

;; allows fuzzy completion
(use-package orderless
  :custom (completion-styles '(orderless)))

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
(use-package magit
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

;; manage projects
(use-package projectile
  :config
  (projectile-mode +1))

;; icons are pretty
(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :init
  (all-the-icons-completion-mode))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-preselect-first nil)
  (corfu-auto t)

  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("C-j" . corfu-next)
        ("C-k" . corfu-previous) ;; not working :/
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))

  :init
  (corfu-global-mode))

;; comment with cmd-/
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; because my memory is bad
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; good terminal inside emacs
(use-package vterm)

;; themes
(use-package doom-themes
  :config
  (load-theme 'doom-palenight t)
  (doom-themes-org-config))

;; better keybindings
(use-package general
  :config
  (general-evil-setup t))

(general-create-definer my-leader-def
  ;; :prefix my-leader
  :prefix "SPC")

(general-create-definer my-local-leader-def
  ;; :prefix my-local-leader
  :prefix "SPC m")

;; global Keybindings
(my-leader-def
  :keymaps 'normal
  "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to last buffer")

  "g" '(:ignore t :which-key "git")
  "g g" '(magit :which-key "magit status")

  "p" '(:ignore t :which-key "project")
  "p p" '(consult-projectile :which-key "open known project")
  "p p" '(consult-projectile :which-key "open known project")
  "p a" '(projectile-add-known-project :which-key "add known project")
  "p f" '(projectile-find-file :which-key "find file in project")

  "w" '(:ignore t :which-key "window")
  "w h" '(evil-window-split :which-key "split window horizontally")
  "w v" '(evil-window-vsplit :which-key "split window vertically")

  "b" '(:ignore t :which-key "buffer")
  "b b" '(consult-buffer :which-key "switch to buffer")
  "b d" '(kill-current-buffer :which-key "kill current buffer"))
