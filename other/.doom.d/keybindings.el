;;; $DOOMDIR/keybindings.el -*- lexical-binding: t; -*-

;; Unbinding stuff

(map! :map (evil-normal-state-map global-map)
      "s-RET" nil
      "s-<return>" nil
      "s-s-RET" nil
      "s-s-<return>" nil
      "C-p" nil)

;; General

(map! :desc "Switch to last buffer"
      :leader
      :n "TAB" #'evil-switch-to-windows-last-buffer)

(map! :desc "Search in buffer"
      :n "C-s" #'consult-line)

(map! [remap evil-snipe-s] #'avy-goto-char)

(map! :desc "Open project file"
      "C-p" #'projectile-find-file)

(map! :desc "Toggle dark/light themes"
      :g "<f5>" #'modus-themes-toggle)

(map! :g "s-." #'embark-act)

(map! :leader
      :n "n n" #'theocodes/denote-notes)

(map! :leader
      :n "n f" #'theocodes/denote-find-file)

(map! :leader
      :n "n c" #'denote)

;; Shell

(map! :desc "Run shell command in current directory"
      :n "!" #'async-shell-command)

(map! :desc "Run shell command in project root"
      :n "\;" #'project-async-shell-command)

;; (map! :desc "Run spec file"
;;       :leader
;;       :n "mtv" #'theocodes/rspec-file)

;; (map! :desc "Run single spec"
;;       :leader
;;       :n "mts" #'theocodes/rspec-spec)

(map! :desc "Toggle eshell popup"
      :g "s-i" #'+vterm/toggle)

(map! :desc "Toggle eshell"
      :g "s-I" #'+vterm/here)

;; Window management

(map! :desc "Vertically split window and focus new"
      :g "s-<return>" #'theocodes/vsplit-window)

(map! :desc "Horizontally split window and focus new"
      :g "S-s-<return>" #'theocodes/split-window)

(map! :desc "Kill current window/tab/buffer"
      :n "s-w" #'theocodes/dwim-delete-window
      :n "q" #'theocodes/dwim-delete-window)
