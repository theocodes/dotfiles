local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap
local xmap = utils.xmap

nmap("<leader>op", "<cmd>Neotree float reveal_force_cwd<cr>", { desc = "Show floating Neotree" })
nmap("Q", "<cmd>qa<cr>", { desc = "Quit all" })
nmap("q", "<cmd>q<cr>", { desc = "Close window" })
nmap("<C-x><C-e>", ":so %<CR>", { desc = "Eval current file" })
nmap("<leader>u", ":UndotreeToggle<CR>", { desc ="Toggle undo tree" })
nmap("<leader><TAB>", "<C-^>", { desc = "Switch to previous buffer" })

vmap("<TAB>", ">gv", { desc = "Indent selection" })
vmap("<S-TAB>", "<gv", { desc = "De-indent selection" })

xmap("J", ":move '>+1<CR>gv-gv", { desc = "Move line down" })
xmap("K", ":move '<-2<CR>gv-gv", { desc = "Move line up" })

