;;; -*- lexical-binding: t; -*-

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :custom
  (evil-want-integration t)
  (evil-want-C-i-jump nil)
  (evil-want-C-u-scroll t)
  (evil-respect-visual-line-mode t)
  (evil-undo-system 'undo-tree)
  :config

  (evil-mode 1)

  (define-key evil-normal-state-map (kbd ";") 'project-async-shell-command)
  (define-key evil-normal-state-map (kbd "!") 'async-shell-command)

  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (define-key evil-normal-state-map (kbd "s") 'avy-goto-char)

  (define-key evil-normal-state-map (kbd "K") 'theocodes/describe-thing-at-point)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (define-key evil-normal-state-map (kbd "q") 'kill-current-buffer)

  (evil-set-initial-state 'shell-mode 'normal)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :config
  (evil-collection-init))

(use-package which-key
  :init
  (setq which-key-idle-delay 1)
  :config
  (which-key-mode 1))

(use-package general
  :config
  (general-create-definer rune/leader-keys
                          :keymaps '(normal insert visual emacs)
                          :prefix "SPC"
                          :global-prefix "C-SPC"))

(rune/leader-keys
    "n"  '(:ignore t :which-key "notes")
    "nn" '(theocodes/notes-dired :which-key "open notes")
    "nc" '(denote :which-key "create a new note")
    "nf" '(theocodes/notes-find :which-key "find a note")

    "f"  '(:ignore t :which-key "files")
    "fr" '(consult-recent-file :which-key "open a recent file")

    "l"  '(:ignore t :which-key "lsp")
    "ld" '(flymake-show-buffer-diagnostics :which-key "show diagnostics buffer")

    "w"  '(:ignore t :which-key "window")
    "ww" '(ace-window :which-key "select window to jump to")
    "wsh" '(evil-window-split :which-key "split window horizontally")
    "wsv" '(evil-window-vsplit :which-key "split window vertically")

    "t"  '(:ignore t :which-key "tabs")
    "tn" '(tab-new :which-key "create new tab")
    "tr" '(tab-bar-rename-tab :which-key "rename tab")
    "tm"  '(:ignore t :which-key "tab move")
    "tml" '(tab-bar-move-tab-backward :which-key "move tab left")
    "tmr" '(tab-bar-move-tab :which-key "move tab right")

    "m"  '(:ignore t :which-key "local")
    "mt"  '(:ignore t :which-key "tests")
    "mts"  '(theocodes/rspec-spec :which-key "run spec near cursor")
    "mtv"  '(theocodes/rspec-file :which-key "run current spec buffer")
    "mta"  '(rspec-verify-all :which-key "run all specs")

    "b"  '(:ignore t :which-key "buffers")
    "bb" '(consult-project-buffer :which-key "list and find buffer")
    "bB" '(consult-buffer :which-key "list and find buffer")
    "bd" '(kill-current-buffer :which-key "kill current buffer")

    "p"  '(:ignore t :which-key "project")
    "pp"  '(projectile-switch-project :which-key "switch to project")
    "pa"  '(projectile-add-known-project :which-key "add new project")
    "pd"  '(projectile-remove-known-project :which-key "remove project")
    "pf"  '(projectile-find-file :which-key "find file in project")
    "pk"  '(projectile-kill-buffers :which-key "kill all project buffers")

    "o"  '(:ignore t :which-key "open")
    "op" '(theocodes/neotree-project-dir :which-key "open project side view")
    "ot" '(theocodes/open-vterm-tab :which-key "open project vterm in new tab")

    "g"  '(:ignore t :which-key "git")
    "gb" '(magit-branch :which-key "branch actions")
    "gg" '(magit :which-key "magit status")

    "*"   '(consult-ripgrep :which-key "search in project")
    "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to last buffer")
    "SPC" '(dired-jump :which-key "dired on current directory")
    "`"   '(persp-switch :which-key "switch/create perspective")
    "."   '(find-file :which-key "find file"))

;; split window and focus on new window
(global-set-key (kbd "M-<return>") (lambda () (interactive) (evil-window-vsplit) (other-window 1)))
(global-set-key (kbd "M-S-<return>") (lambda () (interactive) (split-window-below) (other-window 1)))

(global-set-key (kbd "M-w") 'theocodes/dwim-delete-window)

;; Paste with M-v (mac) or Ctrl-Shift-v
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "C-S-V") 'yank)

;; Copy with cmd-c
(global-set-key (kbd "M-c") 'evil-yank)

;; Kill buffer with Q in dired also
(require 'dired)
(define-key dired-mode-map [remap quit-window] #'kill-current-buffer)

;; fuzzy search in buffer
(global-set-key (kbd "C-s") 'consult-line)

(setq completion-in-region-function #'consult-completion-in-region)

(customize-set-variable 'completion-styles '(orderless))
(customize-set-variable 'completion-category-overrides '((file (styles . (partial-completion)))))

(global-set-key [remap describe-bindings] #'embark-bindings)
(global-set-key (kbd "C-.") 'embark-act)

;; Use Embark to show bindings in a key prefix with `C-h`
(setq prefix-help-command #'embark-prefix-help-command)

;(with-eval-after-load 'embark-consult
;  (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))

(global-set-key (kbd "M-l") 'evil-window-right)
(global-set-key (kbd "M-h") 'evil-window-left)
(global-set-key (kbd "M-j") 'evil-window-down)
(global-set-key (kbd "M-k") 'evil-window-up)

;; override M-{hl} on eshell to move to side windows
(global-set-key [remap eshell-forward-argument] #'evil-window-right)
(global-set-key [remap eshell-backward-argument] #'evil-window-left)

(global-set-key (kbd "M-1") (lambda () (interactive) (theocodes/switch-to-perspective-by-number 1)))
(global-set-key (kbd "M-2") (lambda () (interactive) (theocodes/switch-to-perspective-by-number 2)))
(global-set-key (kbd "M-3") (lambda () (interactive) (theocodes/switch-to-perspective-by-number 3)))
(global-set-key (kbd "M-4") (lambda () (interactive) (theocodes/switch-to-perspective-by-number 4)))
(global-set-key (kbd "M-5") (lambda () (interactive) (theocodes/switch-to-perspective-by-number 5)))
(global-set-key (kbd "M-6") (lambda () (interactive) (theocodes/switch-to-perspective-by-number 6)))

;; shells
(global-set-key (kbd "M-i") 'theocodes/eshell-popup-toggle)
(global-set-key (kbd "M-I") 'theocodes/eshell-toggle)
(global-set-key (kbd "M-o") 'theocodes/vterm-popup-toggle)
(global-set-key (kbd "M-O") 'theocodes/vterm-toggle)
