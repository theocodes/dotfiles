;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Theo Felippe"
      user-mail-address "public@theocodes.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Cascadia Mono" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
;;
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! feature-mode
  (display-line-numbers-mode))

;; paste while in insert mode
(map! :g "C-S-V" #'yank)

;; search buffer
(map! :g "C-s" #'swiper)

;; toggle term popup
(map! :g "C-`" #'+vterm/toggle)

;; journal
(map! :leader
      (:prefix ("j" . "journal")
      :desc "find file"
      "f" #'org-roam-find-file
      :desc "Open journal directory"
      "d" #'org-roam-dailies-find-directory
      :desc "Open journal for yesterday"
      "y" #'org-roam-dailies-find-yesterday
      :desc "Open journal for today"
      "j" #'org-roam-dailies-find-today
      :desc "Open journal for tomorrow"
      "t" #'org-roam-dailies-find-tomorrow))

;; org
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  (setq org-directory "~/org/"
        org-ellipsis " ▽"
        org-todo-keywords '((sequence "TODO(t)" "PROGRESS(p)" "BLOCKED(b)" "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces '(("TODO" :foreground "#7c7c75" :weight bold)
                                 ("BLOCKED" :foreground "#9f7efe" :weight bold)
                                 ("PROGRESS" :foreground "#0098dd" :weight bold)
                                 ("DONE" :foreground "#50a14f" :weight bold)
                                 ("CANCELLED" :foreground "#ff6480" :weight bold))))

(setq org-roam-directory "~/org/")

;; transparency
;; (set-frame-parameter (selected-frame) 'alpha '(96 . 96))
;; (add-to-list 'default-frame-alist '(alpha . (96 . 96)))
;; (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; golang
(setq gofmt-command "goimports")
;(setq-hook! 'go-mode-hook +format-with-lsp nil)

;; rust
(use-package! lsp-mode
  :custom
  (lsp-rust-analyzer-server-display-inlay-hints t))
