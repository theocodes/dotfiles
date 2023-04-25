return {

  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- fuzzy finder
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<C-s>", ":FzfLua blines<CR>", desc = "Search in current file" },
      { "<C-p>", ":FzfLua files<CR>", desc = "Fuzzy find files" },
      { "<leader>pf", ":FzfLua files<CR>", desc = "Fuzzy find files" },
      { "<leader>bb", "<cmd>FzfLua buffers<CR>", desc = "Search open buffers" },
      { "<leader>*", "<cmd>FzfLua live_grep<CR>", desc = "Live grep project" },
    },
    config = {
      git = {
        files = {
          git_icons = false,
          file_icons = false
        }
      },
      winopts = {
        border = "single",
        fullscreen = false,
        preview = {
          vertical = "up:80%",
          layout = "vertical"
        }
      }
    }
  },

  -- which-key
  {
    "folke/which-key.nvim",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
       -- ["l"] = { name = "+lsp" },
       -- ["gz"] = { name = "+surround" },
       -- ["]"] = { name = "+next" },
       -- ["["] = { name = "+prev" },
       -- ["<leader><tab>"] = { name = "+tabs" },
       -- ["<leader>b"] = { name = "+buffer" },
       -- ["<leader>c"] = { name = "+code" },
       -- ["<leader>f"] = { name = "+file/find" },
       -- ["<leader>g"] = { name = "+git" },
       -- ["<leader>gh"] = { name = "+hunks" },
       -- ["<leader>q"] = { name = "+quit/session" },
       -- ["<leader>s"] = { name = "+search" },
       -- ["<leader>sn"] = { name = "+noice" },
       -- ["<leader>u"] = { name = "+ui" },
       -- ["<leader>w"] = { name = "+windows" },
       -- ["<leader>x"] = { name = "+diagnostics/quickfix" },
      })
    end,
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  -- references
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
          pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
        end,
      })
    end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },

  -- easy jumping around file
  {
  	"phaazon/hop.nvim",
  	keys = {
  		{ "s", "<cmd>HopWord<cr>", desc = "Hop" }
  	},
  	config = {
      keys = "etovxqpdygfblzhckisuran"
  	}
  },

  {
    "cappyzawa/trim.nvim",
    opts = {
      trim_on_write = true,
      trim_trailing = true,
      trim_last_line = true,
      trim_first_line = false,
    }
  }
}
