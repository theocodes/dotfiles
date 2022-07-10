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
    "nc" '(denote :which-key "capture note")
    "nf" '(t/denote-search-note :which-key "open notes directory in dired")

    "f"  '(:ignore t :which-key "files")
    "fr" '(consult-recent-file :which-key "open a recent file")

    "w"  '(:ignore t :which-key "window")
    "wsh" '(evil-window-split :which-key "split window horizontally")
    "wsv" '(evil-window-vsplit :which-key "split window vertically")

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

    "g"  '(:ignore t :which-key "git")
    "gb" '(magit-branch :which-key "branch actions")
    "gg" '(magit :which-key "magit status")

    "*"   '(consult-ripgrep :which-key "search in project")
    "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to last buffer")
    "SPC" '(dired-jump :which-key "dired on current directory")
    "`"   '(persp-switch :which-key "switch/create perspective")
    "."   '(find-file :which-key "find file"))

;; find file the old way
(global-set-key (kbd "C-p") 'project-find-file)

;; New tab with Cmd-Return
(global-set-key (kbd "M-RET") 'tab-new)

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
(global-set-key (kbd "M-j") 'evil-window-bottom)
(global-set-key (kbd "M-k") 'evil-window-top)

;; override M-{hl} on eshell to move to side windows
(global-set-key [remap eshell-forward-argument] #'evil-window-right)
(global-set-key [remap eshell-backward-argument] #'evil-window-left)

;; quick switch between perspectives
(global-set-key (kbd "M-1") 't/switch-to-perspective-one)
(global-set-key (kbd "M-2") 't/switch-to-perspective-two)
(global-set-key (kbd "M-3") 't/switch-to-perspective-three)
