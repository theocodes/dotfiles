local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 30,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-n>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-\\>', [[<C-\><C-n><C-W>h]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local irb = Terminal:new({ cmd = "irb", hidden = true })
function _IRB_TOGGLE()
	irb:toggle()
end

local rails = Terminal:new({ cmd = "rails console", hidden = true })
function _RAILS_TOGGLE()
	rails:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
	node:toggle()
end

local notes = Terminal:new({ cmd = "notes", hidden = true })
function _NOTES_TOGGLE()
	notes:toggle()
end

local journal = Terminal:new({ cmd = "notes today", hidden = true })
function _JOURNAL_TOGGLE()
	journal:toggle()
end

local run_spec = function(cmd)
  return Terminal:new({
    cmd = cmd,
    hidden = true,
    direction = "float",
    close_on_exit = false
  })
end

function _RSPEC_SPEC()
  local file = vim.api.nvim_eval("expand('%')")

	run_spec("rspec " .. file):toggle()
end

function _RSPEC_SPEC_SINGLE()
  local file = vim.api.nvim_eval("expand('%')")
  local line = vim.api.nvim_eval("line('.')")

	run_spec("rspec " .. file .. ":" .. line):toggle()
end
