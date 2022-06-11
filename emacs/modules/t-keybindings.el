;;; t-keybindings.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'general)
(straight-use-package 'which-key)

;; Which-key

(require 'which-key)
(setq which-key-idle-delay 1)
(which-key-mode 1)

;; General

(require 'general)

(general-create-definer rune/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(rune/leader-keys
    "n"  '(:ignore t :which-key "notes")
    "nf" '(org-roam-node-find :which-key "find or create node")
    "nc" '(org-roam-dailies-capture-today :which-key "capture note")
    "nd" '(org-roam-dailies-goto-date :which-key "go to date")
    "nt" '(org-roam-dailies-goto-today :which-key "go to today")

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
    "pp"  '(project-switch-project :which-key "switch to project")
    "pf"  '(project-find-file :which-key "find file in project")
    "pk"  '(project-kill-buffers :which-key "kill all project buffers")

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

;; Paste with cmd-v
(global-set-key (kbd "M-v") 'yank)

(defun t/select-tab-1 () (interactive) (tab-bar-select-tab 1))
(defun t/select-tab-2 () (interactive) (tab-bar-select-tab 2))
(defun t/select-tab-3 () (interactive) (tab-bar-select-tab 3))
(defun t/select-tab-4 () (interactive) (tab-bar-select-tab 4))
(defun t/select-tab-5 () (interactive) (tab-bar-select-tab 5))

(global-set-key (kbd "M-1") 't/select-tab-1)
(global-set-key (kbd "M-2") 't/select-tab-2)
(global-set-key (kbd "M-3") 't/select-tab-3)
(global-set-key (kbd "M-4") 't/select-tab-4)
(global-set-key (kbd "M-5") 't/select-tab-5)

(provide 't-keybindings)
