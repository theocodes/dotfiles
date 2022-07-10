;; relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; configure and load company
(setq company-idle-delay 0
      company-minimum-prefix-length 3
      company-selection-wrap-around t
      company-backends '((company-capf company-dabbrev-code)))

(add-hook 'after-init-hook 'global-company-mode)

(company-tng-configure-default)

;; load perspective
(setq persp-mode-prefix-key "")
(persp-mode)

;; set projectile project search path
(when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))

(projectile-global-mode +1)

;; find the cursor
(pulsar-global-mode 1)

;; show changes from hit in the gutter
(global-diff-hl-mode)

;; highlight matching parens
(show-paren-mode 1)

;; enable multiedit with evil keys
(require 'evil-multiedit)
(evil-multiedit-default-keybinds)
