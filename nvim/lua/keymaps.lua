local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap
local xmap = utils.xmap

-- switch to previous buffer
nmap("<TAB>", "<C-^>")

-- clear search highlight
nmap("<esc>", "<cmd>nohlsearch<CR>")

-- quit
nmap("Q", ":q!<CR>")

-- eval lua file
nmap("<C-x><C-e>", ":so %<CR>")

-- kill buffer
nmap("q", ":bd<CR>")

-- indent/Dedent selection
vmap("<TAB>", ">gv")
vmap("<S-TAB>", "<gv")

-- move block up and down
xmap("J", ":move '>+1<CR>gv-gv")
xmap("K", ":move '<-2<CR>gv-gv")

-- toggle undo tree
nmap("<leader>u", ":UndotreeToggle<CR>")
