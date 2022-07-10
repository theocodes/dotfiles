(defun t/configure-eshell ()
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; truncate the buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  (evil-normalize-keymaps)

  (setq eshell-history-size 10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))

(add-hook 'eshell-first-time-mode 't/configure-eshell)

(defun t/configure-vterm ()
  (define-key vterm-mode-map (kbd "M-i") nil))

(add-hook 'vterm-mode-hook 't/configure-vterm)
