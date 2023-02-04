-- Keymaps are automatically loaded on the VeryLazy evet
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function make_mapper(mode, o)
  local parent_opts = vim.deepcopy(o)

  return function(lhs, rhs, opts)
    opts = type(opts) == "string" and { desc = opts } or opts and vim.deepcopy(opts) or {}
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("keep", opts, parent_opts))
  end
end

local map_opts = { remap = true, silent = true }

local nmap = make_mapper("n", map_opts)
local vmap = make_mapper("v", map_opts)
local xmap = make_mapper("x", map_opts)

nmap("<TAB>", "<C-^>", { desc = "Switch to previous buffer" })
nmap("<leader>op", "<cmd>Neotree float reveal_force_cwd<cr>", { desc = "Show floating Neotree" })
nmap("q", ":bd<CR>", { desc = "Kill buffer" })
nmap("Q", "<cmd>qa<cr>", { desc = "Quit" })

nmap("<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Find buffer" })

nmap("<C-x><C-e>", "<cmd>source %<cr>", { desc = "Eval file" })
nmap("<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find file" })

nmap("<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move to pane/split below" })
nmap("<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move to pane/split above" })
nmap("<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move to pane/split to the left" })
nmap("<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move to pane/split to the right" })

vmap("<TAB>", ">gv", { desc = "Indent selection" })
vmap("<S-TAB>", "<gv", { desc = "Deindent selection" })
xmap("J", ":move '>+1<CR>gv-gv", { desc = "Move selected down" })
xmap("K", ":move '<-2<CR>gv-gv", { desc = "Move selected up" })
