return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
    }
  },

  "rebelot/kanagawa.nvim",
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

  {
  	"rmagatti/auto-session",
  	config = {
      log_level = "error"
  	}
  },

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
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
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
  "lunarvim/horizon.nvim",
  "axelf4/vim-strip-trailing-whitespace",
  "machakann/vim-highlightedyank",
  "nvim-treesitter/nvim-treesitter",
  "mbbill/undotree",
  { "maxjacobson/vim-fzf-coauthorship", dependencies = { "junegunn/fzf" } },

  {
    "theocodes/noted.nvim",
    enabled = false,
    name = "noted",
    dir = "/home/theocodes/Code/noted.nvim"
  },
}
