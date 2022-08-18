;; Configuration for evil-mode.

(customize-set-variable 'evil-want-integration t)
(customize-set-variable 'evil-want-keybinding nil)
(customize-set-variable 'evil-want-C-i-jump nil)
(customize-set-variable 'evil-want-C-u-scroll t)
(customize-set-variable 'evil-respect-visual-line-mode t)
(customize-set-variable 'evil-undo-system 'undo-tree)

;; Load Evil and enable it globally
(evil-mode 1)

;; Turn on undo-tree globally
(global-undo-tree-mode)

;; move sideways between tabs
(define-key evil-normal-state-map (kbd "L") 'tab-next)
(define-key evil-normal-state-map (kbd "H") 'tab-previous)

;; move tabs
(define-key evil-normal-state-map (kbd "M-S-<left>") 'tab-bar-move-tab-backward)
(define-key evil-normal-state-map (kbd "M-S-<right>") 'tab-bar-move-tab)

;; show hunk diff
(define-key evil-normal-state-map (kbd "I") 'diff-hl-show-hunk)

(define-key evil-normal-state-map (kbd "q") 'kill-current-buffer)
(define-key evil-normal-state-map (kbd "M-q") 'evil-window-delete)

(define-key evil-normal-state-map (kbd "s") 'avy-goto-char)

(define-key evil-insert-state-map (kbd "C-f") 'copilot-accept-completion)

;; Disable so so it doesn't conflict with embark
(define-key evil-normal-state-map (kbd "C-.") nil)

;; Ctrl-p is for finding files...
(define-key evil-normal-state-map (kbd "C-p") nil)

;; show diagnostics buffer
(define-key evil-normal-state-map (kbd "C-o") 'flymake-show-buffer-diagnostics)

;; describe thing at point
(define-key evil-normal-state-map (kbd "K") 't/describe-thing-at-point)

;; Turn on evil-commentary
(evil-commentary-mode)

;; Enable evil-multiedit
(require 'evil-multiedit)
(evil-multiedit-default-keybinds)

;; Rebind `universal-argument' to 'C-M-u' since 'C-u' now scrolls the buffer
(global-set-key (kbd "C-M-u") 'universal-argument)

;; C-h is backspace in insert state
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; Use visual line motions even outside of visual-line-mode buffers
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

;; Enable collection of evil-specific configurations
(evil-collection-init)