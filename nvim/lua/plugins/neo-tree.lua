return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v2.x",
	keys = {
		{ "<leader>op", "<cmd>Neotree reveal float<cr>", desc = "NeoTree" }
	},
	dependencies = { 
		"nvim-lua/plenary.nvim", 
		"kyazdani42/nvim-web-devicons",
		"MunifTanjim/nui.nvim"
	},
	config = {
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_current"
		}
	}
}
