local theme = 'ivy'

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { '.git' }
  },
  pickers = {
    current_buffer_fuzzy_find = { theme = theme },
    fd = { theme = theme, hidden = true },
    file_browser = { theme = theme, hidden = true },
    find_files = { theme = theme },
    oldfiles = { theme = theme },
    live_grep = { theme = theme },
    commands = { theme = theme },
    git_files = { theme = theme, show_untracked = true },
    git_commits = { theme = theme },
    git_bcommits = { theme = theme },
    git_status = { theme = theme },
    colorscheme = { theme = theme },
    buffers = { theme = theme },
  },
}
