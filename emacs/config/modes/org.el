(require 'org)
(require 'org-tempo)

(setq org-directory "~/Documents/notes")

;; Return or left-click with mouse follows link
(customize-set-variable 'org-return-follows-link t)
(customize-set-variable 'org-mouse-1-follows-link t)

;; Display links as the description provided
(customize-set-variable 'org-descriptive-links t)

;; Hide markup markers
(customize-set-variable 'org-hide-emphasis-markers t)
(add-hook 'org-mode-hook 'org-appear-mode)

;; disable auto-pairing of "<" in org-mode
(add-hook 'org-mode-hook (lambda ()
                          (setq-local electric-pair-inhibit-predicate
                           `(lambda (c)
                               (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("rb" . "src ruby"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("go" . "src go"))
(add-to-list 'org-structure-template-alist '("js" . "src javascript"))

;; do not put spaces on the left
(setq org-src-preserve-indentation t)

;; expand headers when point is past ellipsis
(add-hook 'org-tab-first-hook 'org-end-of-line)

(setq org-src-strip-leading-and-trailing-blank-lines t)
(setq org-startup-folded t)
(setq org-ellipsis " ▾"
      org-special-ctrl-a/e t
      org-startup-indented t
      org-hide-emphasis-markers t
      org-todo-keywords
      '((sequence "TODO" "PROGRESS" "BLOCKED" "DONE"))
      org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("PROGRESS" . "yellow")
        ("BLOCKED" . (:foreground "red" :weight bold))
        ("DONE" . org-done)))

(require 'org-bullets)
(customize-set-variable 'org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))

;; org-roam

(setq org-roam-v2-ack t
        org-roam-dailies-directory "journal/")

(customize-set-variable 'org-roam-directory "~/Documents/notes")
(customize-set-variable 'org-roam-completion-everywhere t)

(require 'org-roam-dailies)
(org-roam-db-autosync-mode)
