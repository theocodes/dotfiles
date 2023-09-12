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
    "cpea2506/one_monokai.nvim",
    opts = {
      transparent = true,
      italics = false
    }
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
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "github/copilot.vim",
  "Mofiqul/adwaita.nvim",
  "axelf4/vim-strip-trailing-whitespace",
  "machakann/vim-highlightedyank",
  "nvim-treesitter/nvim-treesitter",
  "mbbill/undotree",
  { "maxjacobson/vim-fzf-coauthorship", dependencies = { "junegunn/fzf" } },

  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
  }

  -- {
  --   "theocodes/noted.nvim",
  --   enabled = false,
  --   name = "noted",
  --   dir = "/home/theocodes/Code/noted.nvim"
  -- },
}
