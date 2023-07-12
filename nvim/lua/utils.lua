local M = {}

-- Mapping

local function make_mapper(mode, o)
  local parent_opts = vim.deepcopy(o)

  return function(lhs, rhs, opts)
    opts = type(opts) == "string" and { desc = opts } or opts and vim.deepcopy(opts) or {}
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("keep", opts, parent_opts))
  end
end

local map_opts = { remap = true, silent = true }

M.nmap = make_mapper("n", map_opts)
M.vmap = make_mapper("v", map_opts)
M.xmap = make_mapper("x", map_opts)
M.imap = make_mapper("i", map_opts)

-- Terminal

M.zellij_run = function(cmd, o)
  local opts = vim.deepcopy(o)
  local base = "zellij run"
  local flags = ""

  if opts.floating then
    flags = flags .. " -f "
  end

  if opts.close_on_exit then
    flags = flags .. " -c "
  end

  if opts.down then
    flags = flags .. " -d down"
  end

  if opts.right then
    flags = flags .. " -d right"
  end

  io.popen(base .. " " .. flags .. " -- " .. cmd)
end

local function highlight(group, fg, bg, style)
  local cmd = string.format("highlight %s guifg=%s guibg=%s gui=%s", group, fg, bg, style)
  vim.cmd(cmd)
end

M.hi = function(group, opts)
  local fg = opts.fg or "NONE"
  local bg = opts.bg or "NONE"
  local style = opts.style or "NONE"

  highlight(group, fg, bg, style)
end

return M
