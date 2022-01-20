local theme = 'ivy'
local previewer = false

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { '.git' }
  },
  pickers = {
    current_buffer_fuzzy_find = { theme = theme, previewer = previewer },
    fd = { theme = theme, hidden = true, previewer = previewer },
    file_browser = { theme = theme, hidden = true },
    find_files = { theme = theme, previewer = previewer },
    oldfiles = { theme = theme, previewer = previewer },
    live_grep = { theme = theme, previewer = previewer },
    commands = { theme = theme },
    git_files = { theme = theme, show_untracked = true, previewer = previewer },
    git_commits = { theme = theme },
    git_bcommits = { theme = theme },
    git_status = { theme = theme },
    colorscheme = { theme = theme },
    buffers = { theme = theme, previewer = previewer },
  },
}
