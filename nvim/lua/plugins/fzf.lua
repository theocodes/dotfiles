return {
	"ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = {
    "kyazdani42/nvim-web-devicons"
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
}
