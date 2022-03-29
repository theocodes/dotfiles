local g = vim.g
local opt = vim.opt

-- :h options
opt.backup = false                       -- No backup files
opt.swapfile = false                     -- No swap files
opt.clipboard = "unnamedplus"            -- Allow nvim to access clipboard
opt.cmdheight = 1                        -- Hight of command line
opt.hlsearch = true                      -- Highlight all matches in search pattern
opt.expandtab = true                     -- Convert tabs to spaces
opt.showtabline = 0                      -- Always show tabs
opt.cursorline = true                    -- Highlight the current line
opt.undofile = true                      -- Persistent undo
opt.number = true                        -- Set line numbers
opt.relativenumber = true                -- Relative line numbers
opt.signcolumn = "yes"                   -- Always show sign column
opt.wrap = false                         -- Let long lines be long lines
opt.scrolloff = 2                        -- Lines to keep above and below cursor
opt.sidescrolloff = 8                    -- Rumber of columns to left and right cursor
opt.shiftwidth = 2                       -- Spaces per indentation
opt.tabstop = 2                          -- Number of spaces per tab
opt.numberwidth = 4                      -- Width of line numbers column
opt.splitbelow = true                    -- Horizontal splits below current buffer
opt.splitright = true                    -- Vertical splits to the right of current buffer
opt.ignorecase = true                    -- Ignore case on search pattern
opt.smartcase = true                     -- Override ignorecase if pattern contains Uppercased
opt.smartindent = false                   -- Smart indenting when breaking to new line
opt.fileencoding = "utf-8"               -- Duh
opt.termguicolors = true                 -- More colors
opt.mouse = "a"                          -- Allow mouse in all modes
opt.iskeyword:append "-"                 -- This "asdf-asdf" is treated as a single word
-- vim.opt.guifont = "Iosevka Term"
opt.guifont = "Iosevka Nerd Font Mono"

vim.cmd[[autocmd BufWritePre * :%s/\s\+$//e]]


-- g.fzf_layout = { down: "~40%" }

vim.cmd[[let g:fzf_layout = { 'down': '~40%' }]]
