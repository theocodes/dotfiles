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
    "akinsho/toggleterm.nvim",
  	-- keys = {
  	--     { "<C-s>", ":FzfLua blines<CR>", desc = "Search in current file" },
  	--     { "<C-p>", ":FzfLua files<CR>", desc = "Fuzzy find files" },
  	--     { "<leader>pf", ":FzfLua files<CR>", desc = "Fuzzy find files" },
  	--     { "<leader>bb", "<cmd>FzfLua buffers<CR>", desc = "Search open buffers" },
  	--     { "<leader>*", "<cmd>FzfLua live_grep<CR>", desc = "Live grep project" },
  	-- },
  	config = {
      size = 20,
      hide_number = true,
      direction = "float",
      start_in_insert = true,
      insert_mappings = true,
      shade_terminals = true,
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "single",
        winblend = 0,
        highlights = { border = "Normal", background = "Normal" },
      }
  	}
  },

  "lewis6991/gitsigns.nvim",
  "dag/vim-fish",
  "terrortylor/nvim-comment",
  "axelf4/vim-strip-trailing-whitespace",
  "machakann/vim-highlightedyank",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-eunuch",
  -- currently causing lag
  --"github/copilot.vim",
  "windwp/nvim-autopairs",
  "Mofiqul/adwaita.nvim",
  "lunarvim/horizon.nvim",
  "axelf4/vim-strip-trailing-whitespace",
  "machakann/vim-highlightedyank",
  "nvim-treesitter/nvim-treesitter",
  "mbbill/undotree",
  { "maxjacobson/vim-fzf-coauthorship", dependencies = { "junegunn/fzf" } },
}
