;;; t-term.el -*- lexical-binding: t; -*-

(use-package vterm
  :config
  ;; disable so it doesn't conflict with others
  (define-key vterm-mode-map (kbd "C-e") nil)
  (define-key vterm-mode-map (kbd "C-n") nil)
  (define-key vterm-mode-map (kbd "M-i") nil)
  (define-key vterm-mode-map (kbd "M-I") nil)
  (define-key vterm-mode-map (kbd "M-v") nil)
  :load-path  "~/Code/emacs-libvterm/")

(defun t/vterm-popup-toggle ()
  (interactive)
  (let ((buf (get-buffer "*vterm-popup*")))
    (if buf
	(popper-toggle-latest)
      (with-current-buffer (vterm "*vterm-popup*")
	(vterm-send-string (concat "cd " (consult--project-root)))
	(vterm-send-return)
	(vterm-clear)))))

(defun t/vterm-toggle ()
  (interactive)
  (let* ((buf-name (concat "*vterm " (consult--project-name (consult--project-root)) "*"))
         (buf (get-buffer buf-name))
         (cur (current-buffer)))
    (if buf
        (if (eq cur buf)
            (evil-switch-to-windows-last-buffer)
        (switch-to-buffer buf-name))
      (with-current-buffer (vterm buf-name)
	(vterm-send-string (concat "cd " (consult--project-root)))
	(vterm-send-return)
	(vterm-clear)))))

(global-set-key (kbd "M-i") 't/vterm-popup-toggle)
(global-set-key (kbd "M-I") 't/vterm-toggle)

;; (defun theocodes/run-command (buf command)
;;   (with-current-buffer (vterm buf)
;;     (setq-local vterm-kill-buffer-on-exit nil)
;;     (vterm-send-string (concat "cd " (projectile-project-root)))
;;     (vterm-send-return)
;;     (vterm-clear)
;;     (vterm-send-string command)
;;     (vterm-send-return)
;;     (evil-force-normal-state)))

;; (defun theocodes/rspec-spec ()
;;   (interactive)
;;   (let
;;       ((file (file-relative-name buffer-file-name (projectile-project-root))))
;;     (with-current-buffer (vterm "*rspec-popup*")
;;       (setq-local vterm-kill-buffer-on-exit nil)
;;       (vterm-send-string (concat "cd " (projectile-project-root)))
;;       (vterm-send-return)
;;       (vterm-clear)
;;       (vterm-send-string (concat "rspec " file " && exit"))
;;       (vterm-send-return)
;;       (evil-force-normal-state))))

;; (defun theocodes/rspec-spec-single ()
;;   (interactive)
;;   (let
;;       ((file (file-relative-name buffer-file-name (projectile-project-root)))
;;        (line (line-number-at-pos)))
;;     (with-current-buffer (vterm "*rspec-popup*")
;;       (setq-local vterm-kill-buffer-on-exit nil)
;;       (vterm-send-string (concat "cd " (projectile-project-root)))
;;       (vterm-send-return)
;;       (vterm-clear)
;;       (vterm-send-string (concat "rspec " file ":" (number-to-string line) " && exit"))
;;       (vterm-send-return)
;;       (evil-force-normal-state))))

(provide 't-term)
