return {
  "folke/which-key.nvim",

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- {
  -- 	"rmagatti/auto-session",
  -- 	config = {
  --     log_level = "error"
  -- 	}
  -- },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      options = {"globals", "buffers", "curdir", "tabpages", "winsize"},
      pre_save = function() vim.api.nvim_exec_autocmds('User', {pattern = 'SessionSavePre'}) end,
    }
  },

  -- {
  -- "m4xshen/smartcolumn.nvim",
  --   opts = {
  --     colorcolumn = 120
  --   }
  -- },

  {
    'tzachar/local-highlight.nvim',
  },

  "tiagovla/tokyodark.nvim",

  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = true,
    priority = 1000
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d>',
    }
  },

  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        -- "icon",
        "permissions",
        "size"
      }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  "dag/vim-fish",
  "terrortylor/nvim-comment",
  "axelf4/vim-strip-trailing-whitespace",
  "machakann/vim-highlightedyank",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-eunuch",
  "github/copilot.vim",
  "windwp/nvim-autopairs",
  "Mofiqul/adwaita.nvim",
  "axelf4/vim-strip-trailing-whitespace",
  "machakann/vim-highlightedyank",
  "nvim-treesitter/nvim-treesitter",
  "mbbill/undotree",
  { "maxjacobson/vim-fzf-coauthorship", dependencies = { "junegunn/fzf" } },

  -- {
  --   "theocodes/noted.nvim",
  --   enabled = false,
  --   name = "noted",
  --   dir = "/home/theocodes/Code/noted.nvim"
  -- },
}
