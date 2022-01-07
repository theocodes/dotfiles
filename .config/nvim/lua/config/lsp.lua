local nvim_lsp = require('lspconfig')

local servers = {'solargraph'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end

-- gutter icons for diagnostics
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}


-- local lsp_installer = require("nvim-lsp-installer")
-- special config for lsp servers
-- lsp_installer.on_server_ready(function(server) 
--   local opts = {}
-- 
--   if server.name == 'solargraph' then
--     opts.cmd = { "~/.local/share/nvim/lsp_servers/solargraph" }
--     opts.settings = {
--       solargraph = {
--         diagnostics = true
--       }
--     }
--   end
-- 
--   if server.name == 'sumneko_lua' then
--     opts.settings = {
--       Lua = {
--         diagnostics = {
--           globals = { 'vim' }
--         }
--       }
--     }
--   end
-- 
--   server:setup(opts)
-- end)

-- disable inline lsp diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = false,
--   underline = false
-- })

