local theme = 'ivy'

require('telescope').setup{
  pickers = {
    current_buffer_fuzzy_find = { theme = theme },
    fd = { theme = theme },
    file_browser = { theme = theme },
    find_files = { theme = theme },
    live_grep = { theme = theme },
    commands = { theme = theme },
    git_files = { theme = theme },
    git_commits = { theme = theme },
    git_bcommits = { theme = theme },
    git_status = { theme = theme },
    colorscheme = { theme = theme },
    buffers = { theme = theme },
  },
}
