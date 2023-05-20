return {
  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  -- lsp
  {
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
      local cmp = require('cmp')

      lsp.preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
      })

      lsp.setup_nvim_cmp({
        preselect = 'none',
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect'
        },
        mapping = lsp.defaults.cmp_mappings({
          ['<Tab>'] = vim.NIL,
          ['<S-Tab>'] = vim.NIL,
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
        })
      })

      -- force to use globally installed solargraph
      lsp.configure('solargraph', {force_setup = true})

      -- Configure lua language server for neovim
      lsp.nvim_workspace()

      lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr}
        local bind = vim.keymap.set

        bind("n", "gd", '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        bind("n", "K", '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        bind('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      end)

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
  },

  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = "BufReadPost",
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- golang support
  "fatih/vim-go",

  -- KDL support (zellij)
  "imsnif/kdl.vim",

  -- rust
  "rust-lang/rust.vim",
  {
    "simrat39/rust-tools.nvim",
    name = "rust-tools",
    config = function ()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr })
          end,
        },
      })

      rt.inlay_hints.enable()
      vim.g.rustfmt_autosave = 1
    end
  },

  "evanleck/vim-svelte",

  -- elixir
  {
    "elixir-tools/elixir-tools.nvim",
    ft = { "elixir", "eex", "heex", "surface" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        credo = {},
        elixirls = {
          enabled = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = true,
          },
          on_attach = function(client, bufnr)
            local map_opts = { buffer = true, noremap = true}

            -- run the codelens under the cursor
            vim.keymap.set("n", "<space>mts",  vim.lsp.codelens.run, map_opts)
            -- remove the pipe operator
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
            -- add the pipe operator
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

            -- bindings for standard LSP functions.
            vim.keymap.set("n", "<space>df", "<cmd>lua vim.lsp.buf.format()<cr>", map_opts)
            vim.keymap.set("n", "<space>gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
            vim.keymap.set("n", "<space>dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
            vim.keymap.set("n", "<space>K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
            vim.keymap.set("n", "<space>gD","<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
            vim.keymap.set("n", "<space>1gD","<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)

            vim.keymap.set("n", "<space>gr", ":References<cr>", map_opts)
            vim.keymap.set("n", "<space>g0", ":DocumentSymbols<cr>", map_opts)
            vim.keymap.set("n", "<space>gW", ":WorkspaceSymbols<cr>", map_opts)
            vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)
          end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- syntax highlighting for lots of languages
  "sheerun/vim-polyglot"
}
