;; Configuration for evil-mode.

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

  (define-key evil-normal-state-map (kbd ";") 'projectile-run-async-shell-command-in-root)
  (define-key evil-normal-state-map (kbd "!") 'async-shell-command)

  (define-key evil-normal-state-map (kbd "Q") 'evil-quit)

  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (define-key evil-normal-state-map (kbd "s") 'avy-goto-char)

  (define-key evil-normal-state-map (kbd "K") 't/describe-thing-at-point)

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
