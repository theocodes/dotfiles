(defun corfu-enable-always-in-minibuffer ()
  "Enable Corfu in the minibuffer if Vertico/Mct are not active."
  (unless (or (bound-and-true-p mct--active)
              (bound-and-true-p vertico--input))
    (setq-local corfu-auto nil)
    (corfu-mode 1)))
(add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-preselect-first nil)
  (corfu-min-width 80)
  (corfu-max-width corfu-min-width)
  (corfu-count 14)
  (corfu-scroll-margin 4)
  (corfu-quit-at-boundary 'separator)
  (corfu-separator ?\s)
  (corfu-quit-no-match 'separator)
  (corfu-preview-current 'insert)
  (corfu-preselect-first nil)
  (corfu-echo-documentation t)

  (tab-always-indent 'complete)
  (completion-cycle-threshold nil)

  :bind
  (:map corfu-map
        ("M-d" . corfu-show-documentation)
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))

  :init
  (global-corfu-mode))

(use-package corfu-doc
  :after corfu
  :hook (corfu-mode . corfu-doc-mode)
  ;; :general (:keymaps 'corfu-map
  ;;                    ;; This is a manual toggle for the documentation popup.
  ;;                    [remap corfu-show-documentation] #'corfu-doc-toggle ; Remap the default doc command
  ;;                    ;; Scroll in the documentation window
  ;;                    "M-n" #'corfu-doc-scroll-up
  ;;                    "M-p" #'corfu-doc-scroll-down)
  :custom
  (corfu-doc-delay 0.5)
  (corfu-doc-max-width 70)
  (corfu-doc-max-height 20)

  (corfu-echo-documentation nil))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-symbol))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default)
  (kind-icon-blend-background nil)
  (kind-icon-blend-frac 0.08)

  (svg-lib-icons-dir (no-littering-expand-var-file-name "svg-lib/cache/"))
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)

  (add-hook 'kb/themes-hooks #'(lambda () (interactive) (kind-icon-reset-cache))))
