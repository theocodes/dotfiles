;; how long before which-key shows up
(setq which-key-idle-delay 1)

;; load which-key
(which-key-mode 1)

(general-create-definer rune/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(rune/leader-keys
    "n"  '(:ignore t :which-key "notes")
    "nn" '(deft :which-key "open notes")
    "nc" '(denote :which-key "create a new note")
    "nd" '(deft-delete-file :which-key "delete a new note")
    "nf" '(deft-find-file :which-key "find a note")

    "f"  '(:ignore t :which-key "files")
    "fr" '(consult-recent-file :which-key "open a recent file")

    "l"  '(:ignore t :which-key "lsp")
    "ld" '(flymake-show-buffer-diagnostics :which-key "show diagnostics buffer")

    "w"  '(:ignore t :which-key "window")
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
    "mts"  '(theocodes/rspec-spec-single :which-key "run spec near cursor")
    "mtv"  '(theocodes/rspec-spec :which-key "run current spec buffer")
    "mta"  '(rspec-verify-all :which-key "run all specs")

    "b"  '(:ignore t :which-key "buffers")
    "bb" '(consult-buffer :which-key "list and find buffer")
    "bd" '(kill-current-buffer :which-key "kill current buffer")

    "p"  '(:ignore t :which-key "project")
    "pp"  '(projectile-switch-project :which-key "switch to project")
    "pa"  '(projectile-add-known-project :which-key "add new project")
    "pd"  '(projectile-remove-known-project :which-key "remove project")
    "pf"  '(projectile-find-file :which-key "find file in project")
    "pk"  '(projectile-kill-buffers :which-key "kill all project buffers")

    "o"  '(:ignore t :which-key "open")
    "op" '(neotree-toggle :which-key "open project side view")
    "ot" '(t/open-vterm-tab :which-key "open project vterm in new tab")

    "g"  '(:ignore t :which-key "git")
    "gb" '(magit-branch :which-key "branch actions")
    "gg" '(magit :which-key "magit status")

    "*"   '(consult-ripgrep :which-key "search in project")
    "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to last buffer")
    "SPC" '(dired-jump :which-key "dired on current directory")
    "`"   '(persp-switch :which-key "switch/create perspective")
    "."   '(find-file :which-key "find file"))

(global-set-key (kbd "C-p") 'project-find-file)
(global-set-key (kbd "M-t") 'tab-new)

;; split window and focus on new window
(global-set-key (kbd "M-<return>") (lambda () (interactive) (evil-window-vsplit) (other-window 1)))
(global-set-key (kbd "M-S-<return>") (lambda () (interactive) (split-window-below) (other-window 1)))

(global-set-key (kbd "M-w") 'delete-window)

;; Paste with M-v (mac) or Ctrl-Shift-v
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "C-S-V") 'yank)

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

(with-eval-after-load 'embark-consult
  (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))

(global-set-key (kbd "M-l") 'evil-window-right)
(global-set-key (kbd "M-h") 'evil-window-left)
(global-set-key (kbd "M-j") 'evil-window-down)
(global-set-key (kbd "M-k") 'evil-window-up)

;; override M-{hl} on eshell to move to side windows
(global-set-key [remap eshell-forward-argument] #'evil-window-right)
(global-set-key [remap eshell-backward-argument] #'evil-window-left)

(global-set-key (kbd "M-1") (lambda () (interactive) (t/switch-to-perspective-by-number 1)))
(global-set-key (kbd "M-2") (lambda () (interactive) (t/switch-to-perspective-by-number 2)))
(global-set-key (kbd "M-3") (lambda () (interactive) (t/switch-to-perspective-by-number 3)))
(global-set-key (kbd "M-4") (lambda () (interactive) (t/switch-to-perspective-by-number 4)))
(global-set-key (kbd "M-5") (lambda () (interactive) (t/switch-to-perspective-by-number 5)))
(global-set-key (kbd "M-6") (lambda () (interactive) (t/switch-to-perspective-by-number 6)))

;; shells
(global-set-key (kbd "M-i") 't/eshell-popup-toggle)
(global-set-key (kbd "M-I") 't/eshell-toggle)
(global-set-key (kbd "M-o") 't/vterm-popup-toggle)
(global-set-key (kbd "M-O") 't/vterm-toggle)
