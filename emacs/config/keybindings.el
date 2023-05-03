;;; -*- lexical-binding: t; -*-

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
    "nc" '(denote-open-or-create :which-key "open or create a new note")
    "nd" '(denote-create-daily-note :which-key "create a new daily note")

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
    "bd" '(kill-current-buffer :which-key "kill current buffer")

    "p"  '(:ignore t :which-key "project")
    "pp"  '(projectile-switch-project :which-key "switch to project")
    "pa"  '(projectile-add-known-project :which-key "add new project")
    "pd"  '(projectile-remove-known-project :which-key "remove project")
    "pf"  '(projectile-find-file :which-key "find file in project")
    "pk"  '(projectile-kill-buffers :which-key "kill all project buffers")

    "g"  '(:ignore t :which-key "git")
    "gb" '(magit-branch :which-key "branch actions")
    "gg" '(magit :which-key "magit status")
    "gl" '(magit-blame :which-key "magit blame")

    "*"   '(consult-ripgrep :which-key "search in project")
    "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to last buffer")
    "SPC" '(dired-jump :which-key "dired on current directory")
    "`"   '(persp-switch :which-key "switch/create perspective")
    "."   '(find-file :which-key "find file"))

;; split window and focus on new window
(global-set-key (kbd "M-RET") (lambda () (interactive) (evil-window-vsplit) (other-window 1)))
(global-set-key (kbd "M--") (lambda () (interactive) (split-window-below) (other-window 1)))

(global-set-key (kbd "M-t") 'tab-bar-new-tab)
(global-set-key (kbd "M-w") 'theocodes/delete-window)

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

;; reuse buffer when navigatin in dired
(put 'dired-find-alternate-file 'disabled nil)
(global-set-key [remap dired-find-file] #'dired-find-alternate-file)
