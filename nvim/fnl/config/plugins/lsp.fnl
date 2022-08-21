(local lspconfig (require :lspconfig))
(local keymaps (require :config.keymaps))
(local cmp-nvim-lsp (require :cmp_nvim_lsp))

(local capabilities (cmp-nvim-lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities)))

;; Enable gopls
(lspconfig.gopls.setup {:on_attach keymaps.set-lsp-mappings
                        :capabilities capabilities})


;; Enable solargraph
(lspconfig.solargraph.setup {:on_attach keymaps.set-lsp-mappings
                             :capabilities capabilities})

;; enable lua
(lspconfig.sumneko_lua.setup {:on_attach keymaps.set-lsp-mappings
                              :capabilities capabilities
                              :settings {:Lua {:runtime {:version "LuaJIT"}
                                               :diagnostics {:globals ["vim"]}
                                               :workspace {:library (vim.api.nvim_get_runtime_file "" true)}}}})
