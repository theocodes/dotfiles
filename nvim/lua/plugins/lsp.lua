return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip',
    -- Snippet Collection (Optional)
    'rafamadriz/friendly-snippets',
	},
  config = function()
    require('mason.settings').set({
      ui = {
        border = 'single'
      }
    })

    local lsp = require("lsp-zero")

    lsp.preset("recommended")
    lsp.ensure_installed({
      "sumneko_lua"
    })
    --
    -- force to use globally installed solargraph
    lsp.configure('solargraph', {force_setup = true})

    -- Configure lua language server for neovim
    lsp.nvim_workspace()

    -- setup lsp
    lsp.setup()

    -- configure diagnostic UI
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = false,
      float = true,
    })
  end
}
