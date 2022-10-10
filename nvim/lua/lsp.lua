local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local map = require("utils").map

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local handlers = { ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }) }

local function set_keymaps()
  map("n", "K", vim.lsp.buf.hover)
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gt", vim.lsp.buf.type_definition)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "rn", vim.lsp.buf.rename)
  map("n", "<leader>ca", vim.lsp.buf.code_action)
  map("n", "<leader>dp", vim.diagnostic.goto_prev)
  map("n", "<leader>dn", vim.diagnostic.goto_next)
  map("n", "<leader>dlb", "<cmd>FzfLua diagnostics_document<cr>")
  map("n", "<leader>dlp", "<cmd>FzfLua diagnostics_workspace<cr>")
end

lspconfig.solargraph.setup({
  on_attach = set_keymaps,
  capabilities = capabilities,
  handlers = handlers
})

lspconfig.sumneko_lua.setup({
  on_attach = set_keymaps,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
})
