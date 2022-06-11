;;; t-ui.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'all-the-icons)
(straight-use-package 'helpful)
(straight-use-package 'doom-modeline)

;; disable welcome screen
(setq inhibit-startup-message t)

;; disable default ui elements
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; tab-line
(setq tab-line-close-button nil
      tab-line-new-button nil)

;;(global-tab-line-mode 1)

;; Set font
(set-face-attribute 'default nil :font "Iosevka" :height 160 :weight 'regular)

;; Customize tab-bar
(setq-default background-color (face-attribute 'default :background))
(set-face-attribute 'tab-bar nil :inherit 'default :background background-color :box background-color :underline nil :overline nil)
(set-face-attribute 'tab-bar-tab nil :inherit 'tab-bar :underline t :weight 'bold :overline nil)
(set-face-attribute 'tab-bar-tab-inactive nil :inherit 'tab-bar :background background-color :foreground "grey" :overline nil)

(setq tab-bar-close-button nil
      tab-bar-new-button nil)

;; Start up the modeline after initialization is finished
(add-hook 'after-init-hook 'doom-modeline-init)

;; Configure `doom-modeline'
(customize-set-variable 'doom-modeline-height 15)
(customize-set-variable 'doom-modeline-bar-width 6)
(customize-set-variable 'doom-modeline-minor-modes t)
(customize-set-variable 'doom-modeline-buffer-file-name-style 'truncate-except-project)

;; Make `describe-*' screens more helpful
(require 'helpful)
(define-key helpful-mode-map [remap revert-buffer] #'helpful-update)
(global-set-key [remap describe-command] #'helpful-command)
(global-set-key [remap describe-function] #'helpful-callable)
(global-set-key [remap describe-key] #'helpful-key)
(global-set-key [remap describe-symbol] #'helpful-symbol)
(global-set-key [remap describe-variable] #'helpful-variable)
(global-set-key (kbd "C-h F") #'helpful-function)

;; Bind extra `describe-*' commands
(global-set-key (kbd "C-h K") #'describe-keymap)

;; relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(vterm-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(provide 't-ui)
