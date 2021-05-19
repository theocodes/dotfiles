local nvim_lsp = require'lspconfig'
local cmd = vim.cmd

require'lspconfig'.gopls.setup{} 

function goimports(timeoutms)
     local context = { source = { organizeImports = true } }
     vim.validate { context = { context, "t", true } }

     local params = vim.lsp.util.make_range_params()
     params.context = context

     local method = "textDocument/codeAction"
     local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
     if resp and resp[1] then
       local result = resp[1].result
       if result and result[1] then
         local edit = result[1].edit
         vim.lsp.util.apply_workspace_edit(edit)
       end
     end

     vim.lsp.buf.formatting()
end

local on_go_attach = function(client)
    cmd 'autocmd BufWritePre *.go lua goimports(1000)'
    -- require'completion'.on_attach(client)
end

nvim_lsp.gopls.setup({ on_attach=on_go_attach })
