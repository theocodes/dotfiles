(import-macros {: map!} :hibiscus.vim)

(local lspconfig (require :lspconfig))
(local cmp-nvim-lsp (require :cmp_nvim_lsp))

(fn set-keymaps []
  (map! [n] "K" 'vim.lsp.buf.hover)
  (map! [n] "gd" 'vim.lsp.buf.definition)
  (map! [n] "<leader>dlb" "<cmd>FzfLua diagnostics_document<cr>")
  (map! [n] "<leader>dlp" "<cmd>FzfLua diagnostics_workspace<cr>"))

(local capabilities (cmp-nvim-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities)))
(local handlers { "textDocument/hover" (vim.lsp.with vim.lsp.handlers.hover { :border "single"})})

(lspconfig.solargraph.setup
  {:on_attach set-keymaps
   :capabilities capabilities
   :handlers handlers})

