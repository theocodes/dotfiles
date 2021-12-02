require('plugins')
require('options')
require('keybindings')

require('_gitsigns')
require('_whichkey')
require('_lualine')
require('_compe')

-- comment with gc/gcc
require('nvim_comment').setup()

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "solargraph" then
      opts.settings = {
        solargraph = {
          diagnostics = true
        }
      }
    end

    server:setup(opts)
end)

-- on wsl add the following to bring vim back to forground with
-- ctrl-x
-- {
--     "command":
--     {
--         "action": "sendInput",
--         "input": "\u0066\u0067\u000D"
--     },
--     "keys": "ctrl+x"
-- }
