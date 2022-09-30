;; -*- lexical-binding: t; -*-

;; Eshell

(use-package eshell-git-prompt)

(defun theocodes/configure-eshell ()
  (interactive)

  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; truncate the buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'consult-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-a") 'eshell-bol)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-e") 'evil-end-of-visual-line)
  (evil-normalize-keymaps)

  (eshell-git-prompt-use-theme 'robbyrussell)

  (eshell/alias "e" "find-file $1")
  (eshell/alias "ff" "find-file $1")
  (eshell/alias "emacs" "find-file $1")
  (eshell/alias "ee" "find-file-other-window $1")

  (eshell/alias "ll" "exa -al $1")

  (eshell/alias "gd" "magit-diff-unstaged")
  (eshell/alias "gds" "magit-diff-staged")
  (eshell/alias "d" "dired $1")

  (setq eshell-history-size 10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))

(add-hook 'eshell-first-time-mode-hook 'theocodes/configure-eshell)

;; Vterm

(defun t/configure-vterm ()
  (interactive)
  (define-key vterm-mode-map (kbd "M-v") 'yank)
  (define-key vterm-mode-map (kbd "M-c") 'evil-yank)
  (define-key vterm-mode-map (kbd "M-O") nil)

  (define-key vterm-mode-map (kbd "M-h") 'evil-window-left)
  (define-key vterm-mode-map (kbd "M-l") 'evil-window-right)
  (define-key vterm-mode-map (kbd "M-j") 'evil-window-bottom)
  (define-key vterm-mode-map (kbd "M-k") 'evil-window-top)

  (define-key vterm-mode-map (kbd "M-i") nil))

(add-hook 'vterm-mode-hook 't/configure-vterm)
