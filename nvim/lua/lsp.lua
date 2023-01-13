local utils = require("utils")
local nmap = utils.nmap
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

function set_keymaps()
  nmap("K", vim.lsp.bug.hover)
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
--local handlers = { "textDocument/hover", vim.lsp.with(vim.lsp.handlers.hover({ border = "single" })) }

lspconfig.solargraph.setup({
  on_attach = set_keymaps,
  --- capabilities = capabilities,
  -- handlers = handlers
})

