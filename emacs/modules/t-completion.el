;;; t-completion.el -*- lexical-binding: t; -*-

;; Install dependencies
(straight-use-package 'consult)
(straight-use-package 'embark)
(straight-use-package 'embark-consult)
(straight-use-package 'marginalia)
(straight-use-package 'orderless)
(straight-use-package 'vertico)
(straight-use-package 'company)

;;; Vertico

(require 'vertico)
;;(require 'vertico-directory)

(with-eval-after-load 'evil
  (define-key vertico-map (kbd "C-j") 'vertico-next)
  (define-key vertico-map (kbd "C-k") 'vertico-previous))
;;  (define-key vertico-map (kbd "M-h") 'vertico-directory-up))

;; Cycle back to top/bottom result when the edge is reached
(customize-set-variable 'vertico-cycle t)

;; Start Vertico
(vertico-mode 1)

;;; Marginalia

;; Configure Marginalia
(require 'marginalia)
(customize-set-variable 'marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(marginalia-mode 1)

;; Set some consult bindings
(global-set-key (kbd "C-s") 'consult-line)
(define-key minibuffer-local-map (kbd "C-r") 'consult-history)

(setq completion-in-region-function #'consult-completion-in-region)

;;; Orderless

;; Set up Orderless for better fuzzy matching
(require 'orderless)
(customize-set-variable 'completion-styles '(orderless))
(customize-set-variable 'completion-category-overrides '((file (styles . (partial-completion)))))

;;; Embark
(require 'embark)
(require 'embark-consult)

(global-set-key [remap describe-bindings] #'embark-bindings)
(global-set-key (kbd "C-.") 'embark-act)

;; Use Embark to show bindings in a key prefix with `C-h`
(setq prefix-help-command #'embark-prefix-help-command)

(with-eval-after-load 'embark-consult
  (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))

;; Company

(setq company-idle-delay 0
      company-minimum-prefix-length 1
      company-selection-wrap-around t
      company-backends '((company-capf company-dabbrev-code)))

(company-tng-configure-default)

;; Copilot

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)

;; (defun my-tab ()
;;   (interactive)
;;   (or (copilot-accept-completion)
;;       (company-indent-or-complete-common nil)))

; modify company-mode behaviors
;; (with-eval-after-load 'company
;;   ;; disable inline previews
;;   (delq 'company-preview-if-just-one-frontend company-frontends)

;;   (define-key company-mode-map (kbd "<tab>") 'my-tab)
;;   (define-key company-mode-map (kbd "TAB") 'my-tab)
;;   (define-key company-active-map (kbd "<tab>") 'my-tab)
;;   (define-key company-active-map (kbd "TAB") 'my-tab))

;; Init
(add-hook 'after-init-hook 'global-company-mode)
(copilot-mode 1)

(provide 't-completion)
