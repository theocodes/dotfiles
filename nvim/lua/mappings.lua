local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap
local xmap = utils.xmap

nmap("<leader>op", "<cmd>Neotree float reveal_force_cwd<cr>", { desc = "Show floating Neotree" })
nmap("Q", "<cmd>qa<cr>", { desc = "Quit all" })
nmap("q", "<cmd>bd<cr>", { desc = "Close buffer" })
nmap("<C-x><C-e>", ":so %<CR>", { desc = "Eval current file" })
nmap("<leader>u", ":UndotreeToggle<CR>", { desc ="Toggle undo tree" })
nmap("<leader><TAB>", "<C-^>", { desc = "Switch to previous buffer" })
nmap(";", ":!", { desc = "Start shell command", silent = false })

nmap("<esc>", "<cmd>nohl<cr>", { desc = "Clear search selection" })

vmap("<TAB>", ">gv", { desc = "Indent selection" })
vmap("<S-TAB>", "<gv", { desc = "De-indent selection" })

xmap("J", ":move '>+1<CR>gv-gv", { desc = "Move line down" })
xmap("K", ":move '<-2<CR>gv-gv", { desc = "Move line up" })

nmap("<leader>gg", function() utils.zellij_run("lazygit", { floating = true, close_on_exit = true }) end, { desc ="Run lazygit" })

-- Test runner helpers

nmap("<leader>mts", function()
  local file = vim.fn.expand('%:p')
  local line = vim.api.nvim_eval "line('.')"

  utils.zellij_run("rspec " .. file .. ":" .. line, { floating = true })
end, { desc ="Run single rspec spec" })

nmap("<leader>mtv", function()
  local file = vim.fn.expand('%:p')

  utils.zellij_run("rspec " .. file, { floating = true })
end, { desc ="Run single rspec spec" })
