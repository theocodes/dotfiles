;; Install and bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight.el by default with use-package
(setq package-enable-at-startup nil
      straight-use-package-by-default t)

;; Install packages

(straight-use-package 'use-package)
(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-commentary)
(straight-use-package 'evil-multiedit)
(straight-use-package 'undo-tree)
(straight-use-package 'doom-themes)
(straight-use-package 'centaur-tabs)
(straight-use-package 'all-the-icons)
(straight-use-package 'helpful)
(straight-use-package 'general)
(straight-use-package 'which-key)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'xclip)
(straight-use-package 'consult)
(straight-use-package 'embark)
(straight-use-package 'embark-consult)
(straight-use-package 'marginalia)
(straight-use-package 'orderless)
(straight-use-package 'vertico)
(straight-use-package 'company)
(straight-use-package 'perspective)
(straight-use-package 'org)
(straight-use-package 'org-bullets)
(straight-use-package 'org-roam)
(straight-use-package 'org-appear)
(straight-use-package 'magit)
(straight-use-package 'projectile)
