(local module {})

(fn set-basic-options []
  "Basic vim options."
  (let [o vim.opt]
    (set o.backup false)
    (set o.swapfile false)
    (set o.clipboard "unnamedplus")
    (set o.cmdheight 1)
    (set o.hlsearch true)
    (set o.undofile true)
    (set o.signcolumn "yes")
    (set o.wrap false)
    (set o.scrolloff 2)
    (set o.sidescrolloff 8)
    (set o.expandtab true)
    (set o.number true)
    (set o.relativenumber true)
    (set o.cursorline true)
    (set o.shiftwidth 2)
    (set o.tabstop 2)
    (set o.numberwidth 4)
    (set o.splitbelow true)
    (set o.splitright true)
    (set o.ignorecase true)
    (set o.smartcase true)
    (set o.smartindent false)
    (set o.fileencoding "utf-8")
    (set o.termguicolors true)
    (set o.mouse "a")
    (set o.list true)
    (set o.listchars "tab:»·,trail:·,nbsp:~")))

(fn set-wsl-clipboard []
  "Use win32yank to copy/paste using the windows system clipboard on WSL."
  (let [clipboard {}
        copy {}
        paste {}]

    (set copy.+ "win32yank.exe -i --crlf")
    (set copy.* "win32yank.exe -i --crlf")
    (set paste.+ "win32yank.exe -o --lf")
    (set paste.* "win32yank.exe -o --lf")
    (set clipboard.name "win32yank-wsl")
    (set clipboard.cache_enabled 0)
    (set clipboard.copy copy)
    (set clipboard.paste paste)

    (set vim.g.clipboard clipboard)))

(fn module.init []
  (set-basic-options)

  ;; check if running on wsl
  (if (not (not (string.find (vim.fn.system "uname -r") "WSL")))
    (set-wsl-clipboard)))

module
