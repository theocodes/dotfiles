return {
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
}
