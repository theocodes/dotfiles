local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "user.config.lsp.installer"
require("user.config.lsp.handlers").setup()

