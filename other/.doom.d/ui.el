;;; ui.el -*- lexical-binding: t; -*-

(setq modus-themes-subtle-line-numbers t
      modus-themes-mode-line '(accented borderless (padding . 4))
      modus-themes-hl-line '(accented)
      modus-themes-bold-constructs t
      doom-theme 'ef-dark)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they accept.
(setq doom-font (font-spec :family "Iosevka Comfy" :size 16 :weight 'light))

;; set background opacity
(set-frame-parameter (selected-frame) 'alpha '(99 . 99))
(add-to-list 'default-frame-alist '(alpha . (99 . 99)))
