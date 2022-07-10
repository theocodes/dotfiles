;; relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

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
(customize-set-variable 'git-gutter:modified-sign " ")
(customize-set-variable 'git-gutter:added-sign " ")
(customize-set-variable 'git-gutter:deleted-sign " ")

;(global-git-gutter-mode +1)

;; highlight matching parens
(show-paren-mode 1)

;; enable multiedit with evil keys
(evil-multiedit-default-keybinds)
