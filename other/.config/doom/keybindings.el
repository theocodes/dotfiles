;;; $DOOMDIR/keybindings.el -*- lexical-binding: t; -*-

(map! :desc "Go to previous tab" :n "H" #'centaur-tabs-backward)
(map! :desc "Go to next tab" :n "L" #'centaur-tabs-forward)

(map! :desc "Last buffer"
      :leader
      "TAB" #'evil-switch-to-windows-last-buffer)

(map! :desc "Run shell command in project root"
      :n
      ";" #'projectile-run-async-shell-command-in-root)

(map! :desc "Run shell command in current directory"
      :n "!" #'async-shell-command)

(map! :desc "Move to left split"
      :n
      "M-l" #'evil-window-right)

(map! :desc "Move to right split"
      :n
      "M-h" #'evil-window-left)

(map! :desc "move to upper split"
      :n
      "M-j" #'evil-window-down)

(map! :desc "move to bottom split"
      :n
      "M-k" #'evil-window-up)

(map! :n "M-m" #'+evil/window-split-and-follow)
(map! :n "M-n" #'+evil/window-vsplit-and-follow)
(map! :ni "M-i" #'+vterm/toggle)
(map! :v "M-TAB" #'indent-rigidly-right)
(map! :n "C-s" #'consult-line)
(map! :g "M-v" #'yank)
(map! :g "M-c" #'evil-yank)

(map! :desc "Find or create a note"
      :leader
      "n c" #'denote-open-or-create)

(map! :desc "Open directory in dired"
      :leader
      "SPC" #'dired-jump)

(map! :desc "Find file in project"
      :map 'evil-normal-state-map
      "C-p" #'projectile-find-file)

(map! :desc "Quit emacs"
      :map 'evil-normal-state-map
      "Q" #'evil-quit)

(map! :desc "Close split or buffer"
      :n
      "q" #'t/close-thing)

(map! :desc "Close split or buffer"
      :n
      "M-w" #'t/close-thing)
