(local helpers {})

(set helpers.wsl? (not (not (string.find (vim.fn.system "uname -r") "WSL"))))
(set helpers.mac? (= (vim.fn.has "macunix") 1))
(set helpers.linux? (and (not mac?) (not wsl?)))

helpers
