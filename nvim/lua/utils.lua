local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.set_highlight(name, rules)
  vim.api.nvim_set_hl(0, name, rules)
end

function M.get_highlight(name)
  return vim.api.nvim_get_hl_by_name(name, true)
end

function M.pp(arg)
  vim.pretty_print(arg)
end

return M
