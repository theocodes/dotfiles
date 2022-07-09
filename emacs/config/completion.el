
(require 'vertico)

(with-eval-after-load 'evil
  (define-key vertico-map (kbd "C-j") 'vertico-next)
  (define-key vertico-map (kbd "C-k") 'vertico-previous))

;; cycle back to top/bottom result when the edge is reached
(customize-set-variable 'vertico-cycle t)

;; start Vertico
(vertico-mode 1)

(customize-set-variable 'marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(marginalia-mode 1)
