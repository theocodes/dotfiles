
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

;; disable text wrapping
(setq-default truncate-lines 1)

;; line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
		shell-mode-hook
		neotree-mode-hook
		vterm-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; no files that I didn't create please!
(setq custom-file (concat user-emacs-directory "/custom.el"))
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq make-backup-files nil)

;; transparency
(defvar efs/frame-transparency '(90 . 90))
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; disable visible bell - was causing issues
(setq visible-bell nil)

(set-face-attribute 'default nil :font "Cascadia Mono" :height 93)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-themes
             :init
(load-theme 'doom-dracula t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package all-the-icons)

;; search in buffer
(use-package swiper)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

;; lisp easy-mode
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; becausem my memory is bad
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 0.3))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
    "."   '(counsel-find-file :which-key "find file")
    "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to last buffer")
    "*"   '(counsel-projectile-rg :which-key "search project with ripgrep")

    "b"  '(:ignore t :which-key "buffers")
    "bb"  '(counsel-ibuffer :which-key "list active buffers")
    "bd"  '(kill-this-buffer :which-key "kill current buffer")

    "w"  '(:ignore t :which-key "window")
    "wv"  '(evil-window-vsplit :which-key "vertically split window")
    "wh"  '(evil-window-split :which-key "horizontally split window")

    "p"  '(:ignore t :which-key "project")
    "pp"  '(counsel-projectile-switch-project :which-key "switch to project")
    "pa"  '(projectile-add-known-project :which-key "add project")
    "pf"  '(counsel-projectile-find-file :which-key "find file in project")
    "pk"  '(projectile-kill-buffers :which-key "kill all project buffers")
    "pi"  '(projectile-invalidate-cache :which-key "invalidate project cache")
    "pr"  '(projectile-remove-known-project :which-key "remove project from known list")

    "g"  '(:ignore t :which-key "git")
    "gg" '(magit-status :which-key "git status")

    "o"  '(:ignore t :which-key "open")
    "op" '(neotree-toggle :which-key "open project view")
    "ot" '(shell-pop :which-key "toggle terminal popup")

    "l"  '(:ignore t :which-key "lsp")
    "ld" '(lsp-describe-thing-at-point :which-key "describe thing at point")
    "lg" '(lsp-find-definition :which-key "find definition")
    "lr" '(lsp-find-references :which-key "find references")

    "f"  '(:ignore t :which-key "bookmaked files")
    "fp" '(bookmark-jump :which-key "emacs config")
    
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-V") 'clipboard-yank)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; commenting with gc
(use-package evil-commentary
  :init
  (evil-commentary-mode))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; (when (file-directory-p "~/repos")
  ;;   (setq projectile-project-search-path '("~/repos")))
  (setq projectile-switch-project-action #'projectile-dired
	projectile-globally-ignored-directories '("")
	projectile-globally-ignored-files '("flake.lock")))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; cucumber
(use-package feature-mode)

;; project tree view
(use-package neotree
  :init
  (setq neo-smart-open t
	neo-show-hidden-files t
	neo-window-width 50))

;; autocomplete
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui)

(use-package lsp-ivy)

(use-package go-mode
  :mode "\\.go\\'"
  :hook (go-mode . lsp-deferred)
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports"))

;; vterm popup
(use-package shell-pop
  :init
  (setq shell-pop-shell-type (quote ("vterm" "*vterm*" (lambda nil (vterm shell-pop-term-shell))))
	shell-pop-universal-key "C-`"
	shell-pop-autocd-to-working-dir t))

(use-package lua-mode)
(use-package haskell-mode)
(use-package fish-mode)
