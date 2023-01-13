local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- must set leader before lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- load plugins
require("lazy").setup('plugins')

-- load config
require("options")
require("ui")
require("keymaps")
require("editing")

-- toggleterm stuff - needs to be moved

local term = require("toggleterm")

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

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
