;; core
(require :plugins)
(require :defaults)
(require :keymaps)
(require :ui)
(require :editing)
(require :lsp)

;; plugins
(require :plugins.fzf)
(require :plugins.gitsigns)
(require :plugins.lualine)
(require :plugins.toggleterm)
;;(require :plugins.bufferline)

(local mason (require :mason))
(mason.setup)
