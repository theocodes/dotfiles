;; Fennel entry point

(require :config.options)
(require :config.keybindings)
(require :config.theme)

(local helpers (require :config.helpers))

(if helpers.wsl?
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

