local nvim_lsp = require'lspconfig'
local cmd = vim.cmd

local on_rust_attach = function(client)
    cmd 'autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)'
    -- require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({ on_attach=on_rust_attach })

