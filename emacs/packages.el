;; install and bootstrap straight.el
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

;; install packages
(defvar packages
  '(
    use-package
    evil
    evil-collection
    evil-commentary
    evil-multiedit
    undo-tree
    doom-themes
    centaur-tabs
    all-the-icons
    helpful
    general
    which-key
    exec-path-from-shell
    xclip
    consult
    embark
    embark-consult
    marginalia
    orderless
    vertico
    company
    perspective
    org
    org-bullets
    org-roam
    org-appear
    magit
    projectile
    denote
    markdown-mode
    modus-themes
    eshell-git-prompt
    pulsar
    counsel
    diff-hl
    git-gutter))

(dolist (x packages)
  (straight-use-package x))
