local term = require("toggleterm")
local map = require("utils").map

term.setup({
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
})

local t = require("toggleterm.terminal")
local terminal = t.Terminal

local lazygit = terminal:new { cmd = "lazygit", hidden = true, direction = "float" }
vim.keymap.set("n", "<leader>gg", function() lazygit:toggle() end, {})

function term_for_command(cmd)
  return terminal:new { cmd = cmd, hidden = true, direction = "float", close_on_exit = false }
end

function run_single_spec()
  local file = vim.api.nvim_eval "expand('%')"
  local line = vim.api.nvim_eval "line('.')"
  local term = term_for_command("rspec " .. file .. ":" .. line)

  term:toggle()
end
vim.keymap.set("n", "<leader>mts", run_single_spec, {})

function run_spec()
  local file = vim.api.nvim_eval "expand('%')"
  local term = term_for_command("rspec " .. file)

  term:toggle()
end
vim.keymap.set("n", "<leader>mtv", run_spec, {})
