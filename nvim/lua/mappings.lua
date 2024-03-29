local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap
local xmap = utils.xmap
local imap = utils.imap

nmap("<leader>op", "<cmd>Neotree float reveal_force_cwd<cr>", { desc = "Show floating Neotree" })
nmap("<leader>gpt", "<cmd>NeoAIToggle<cr>", { desc = "Toggle ChatGPT" })
nmap("Q", "<cmd>qa<cr>", { desc = "Quit all" })
nmap("q", "<cmd>bd<cr>", { desc = "Close buffer" })
nmap("<leader>bd", "<cmd>bd<cr>", { desc = "Close buffer" })
nmap("<C-x><C-e>", ":so %<CR>", { desc = "Eval current file" })
nmap("<leader>u", ":UndotreeToggle<CR>", { desc ="Toggle undo tree" })
nmap("<leader><TAB>", "<C-^>", { desc = "Switch to previous buffer" })
nmap("<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Open DB UI" })
nmap("!", ":!", { desc = "Start shell command", silent = false })
nmap(";", ":", { desc = "Start shell command", silent = false })
nmap("<C-h>", "<cmd>G blame<CR>", { desc = "Show git blame" })
nmap("<leader>sr", [[<cmd>lua require("persistence").load()<cr>]], { desc = "Restore last session" })

nmap("H", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
nmap("L", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
nmap("<leader>bp", "<cmd>BufferPin<CR>", { desc = "Pin buffer" })
nmap("<leader>bc", "<cmd>BufferCloseAllButPinned<CR>", { desc = "Close all buffers except pinned" })

nmap("<esc>", "<cmd>nohl<cr>", { desc = "Clear search selection" })
nmap("<C-n>", "<cmd>NeoAIToggle<CR>", { desc = "Toggle ChatGPT window" })
nmap("<leader><leader>", require("oil").open, { desc = "Open parent directory" })

vmap("<TAB>", ">gv", { desc = "Indent selection" })
vmap("<S-TAB>", "<gv", { desc = "De-indent selection" })

xmap("J", ":move '>+1<CR>gv-gv", { desc = "Move line down" })
xmap("K", ":move '<-2<CR>gv-gv", { desc = "Move line up" })

nmap("<leader>gg", function()
  utils.zellij_run("lazygit", { down = true, close_on_exit = true })
end, { desc ="Run lazygit" })

-- Test runner helpers

nmap("<leader>ts", "<cmd>TestNearest<CR>", { desc ="Run nearest spec" })
nmap("<leader>tv", "<cmd>TestFile<CR>", { desc ="Run whole file" })

nmap("<leader>mts", function()
  local file = vim.fn.expand('%:p')
  local line = vim.api.nvim_eval "line('.')"

  utils.zellij_run("rspec " .. file .. ":" .. line, { floating = true })
end, { desc ="Run single rspec spec" })

nmap("<leader>mtv", function()
  local file = vim.fn.expand('%:p')

  utils.zellij_run("rspec " .. file, { floating = true })
end, { desc ="Run single rspec spec" })

-- Note taking helpers

nmap("<leader>nc", function()
  utils.zellij_run("notes", { down = true, close_on_exit = true })
end, { desc ="Find or create note" })

nmap("<leader>nd", function()
  utils.zellij_run("notes daily", { down = true, close_on_exit = true })
end, { desc ="Find or create note" })

-- qury runner

nmap("<leader>mr", function()
  local file = vim.fn.expand('%:p')

  utils.zellij_run("qury " .. file, { floating = true, close_on_exit = true })
end, { desc ="Run go program" })

nmap("<leader>mr", function()
  local file = vim.fn.expand('%:p')

  utils.zellij_run("qury " .. file, { floating = true, close_on_exit = true })
end, { desc ="Run go program" })

-- ymlr runner

nmap("<leader>yml", function()
  local file = vim.fn.expand('%:p')

end, { desc ="Run single rspec spec" })

-- nmap("<leader>mr", function()
--   utils.zellij_run("cargo run", { floating = true, close_on_exit = false })
-- end, { desc ="cargo run" })

-- imap("<C-f>", function()
--   require("copilot.panel").accept()
-- end, { desc = "accept copilot suggestion" })

-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
--         let g:copilot_no_tab_map = v:true
