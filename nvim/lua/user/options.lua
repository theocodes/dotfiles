-- :h options
vim.opt.backup = false                       -- No backup files
vim.opt.swapfile = false                     -- No swap files
vim.opt.clipboard = "unnamedplus"            -- Allow nvim to access clipboard
vim.opt.cmdheight = 1                        -- Hight of command line
vim.opt.hlsearch = true                      -- Highlight all matches in search pattern
vim.opt.expandtab = true                     -- Convert tabs to spaces
vim.opt.showtabline = 0                      -- Always show tabs
vim.opt.cursorline = true                    -- Highlight the current line
vim.opt.undofile = true                      -- Persistent undo
vim.opt.number = true                        -- Set line numbers
vim.opt.relativenumber = true                -- Relative line numbers
vim.opt.signcolumn = "yes"                   -- Always show sign column
vim.opt.wrap = false                         -- Let long lines be long lines
vim.opt.scrolloff = 2                        -- Lines to keep above and below cursor
vim.opt.sidescrolloff = 8                    -- Rumber of columns to left and right cursor
vim.opt.shiftwidth = 2                       -- Spaces per indentation
vim.opt.tabstop = 2                          -- Number of spaces per tab
vim.opt.numberwidth = 4                      -- Width of line numbers column
vim.opt.splitbelow = true                    -- Horizontal splits below current buffer
vim.opt.splitright = true                    -- Vertical splits to the right of current buffer
vim.opt.ignorecase = true                    -- Ignore case on search pattern
vim.opt.smartcase = true                     -- Override ignorecase if pattern contains Uppercased
vim.opt.smartindent = true                   -- Smart indenting when breaking to new line
vim.opt.fileencoding = "utf-8"               -- Duh
vim.opt.termguicolors = true                 -- More colors
vim.opt.mouse = "a"                          -- Allow mouse in all modes
vim.opt.iskeyword:append "-"                 -- This "asdf-asdf" is treated as a single word

