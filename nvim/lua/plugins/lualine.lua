local custom = require'lualine.themes.adwaita'

custom.normal.a.bg = 'NONE'
custom.normal.b.bg = 'NONE'
custom.normal.c.bg = 'NONE'

custom.insert.a.bg = 'NONE'
custom.insert.b.bg = 'NONE'
custom.insert.c.bg = 'NONE'

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = custom,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  }
})
