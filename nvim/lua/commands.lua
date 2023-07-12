local utils = require("utils")
local z = utils.zellij_run

function YAMLKeys()
  local file = vim.fn.expand('%:p')
  z("ymlr " .. file .. " | fzf", { floating = true, close_on_exit = false })
end

vim.cmd [[
  command! YAMLKeys lua YAMLKeys()
]]

-- nmap("<leader>mr", function()
--   local file = vim.fn.expand('%:p')
--
--   utils.zellij_run("qury " .. file, { floating = true, close_on_exit = true })
-- end, { desc ="Run go program" })
