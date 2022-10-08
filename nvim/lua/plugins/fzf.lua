local fzf = require("fzf-lua")

fzf.setup({
  git = {
    files = {
      file_icons = false,
      git_icons = false
    }
  },
  winopts = {
    border = "none",
    fullscreen = true,
    preview = { vertical = "up:80%", layout = "vertical" }
  }
})
