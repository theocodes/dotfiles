local custom = require'lualine.themes.adwaita'

custom.normal.a.bg = 'NONE'
custom.normal.a.fg = 'White'
custom.normal.b.bg = 'NONE'
custom.normal.c.bg = 'NONE'

custom.insert.a.bg = 'NONE'
custom.insert.a.fg = 'White'
custom.insert.b.bg = 'NONE'
custom.insert.c.bg = 'NONE'

custom.visual.a.bg = 'NONE'
custom.visual.a.fg = 'White'
custom.visual.b.bg = 'NONE'

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = custom,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  }
})
