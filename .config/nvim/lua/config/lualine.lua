local custom = require'lualine.themes.jellybeans'

local colors = {
  base1 = '#272a30',
  base3 = '#2E323C',
  yellow = '#FFD866',
  green = '#b8bb26',
  red = '#fb4934',
  blue = '#83a598',
  white = '#ffffff',
}

custom.normal.a.bg = colors.yellow
custom.normal.b.bg = colors.base3
custom.normal.c.bg = colors.base1

custom.insert.a.bg = colors.white
custom.insert.b.bg = colors.base3

custom.visual.a.bg = colors.blue
custom.visual.b.bg = colors.base3

require('lualine').setup {
  options = {
    theme = custom
  }
}
