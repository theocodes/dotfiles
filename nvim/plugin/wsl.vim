if has('wsl')
  let g:clipboard = {
        \   'name': 'win32yank-wsl',
        \   'copy': {
        \      '+': '/usr/local/bin/win32yank.exe -i --crlf',
        \      '*': '/usr/local/bin/win32yank.exe -i --crlf',
        \    },
        \   'paste': {
        \      '+': '/usr/local/bin/win32yank.exe -o --lf',
        \      '*': '/usr/local/bin/win32yank.exe -o --lf',
        \   },
        \   'cache_enabled': 0,
        \ }
endif

