local theme = require'lualine.themes.codedark'

local colors = {
  black        = '#282828',
  white        = '#ffffff',
  red          = '#fb4934',
  green        = '#8ebd6b',
  blue         = '#83a598',
  yellow       = '#e6db74',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
}

theme.normal.a.fg = colors.white
theme.normal.a.bg = nil
theme.insert.a.fg = colors.green
theme.insert.a.bg = nil
theme.replace.a.fg = colors.red
theme.replace.a.bg = nil
theme.visual.a.bg = nil
theme.visual.a.fg = colors.yellow

theme.normal.b.bg = nil
theme.insert.b.bg = nil
theme.insert.b.fg = colors.darkgray
theme.replace.b.bg = nil
theme.normal.b.fg = colors.darkgray
theme.visual.b.bg = nil
theme.visual.b.fg = colors.darkgray

theme.normal.c.fg = colors.darkgray
theme.normal.c.bg = nil
theme.insert.c.fg = colors.darkgray
theme.insert.c.bg = nil
theme.replace.c.bg = nil
theme.replace.c.fg = colors.darkgray

require('lualine').setup {
  options = {
    theme = theme,
    icons_enabled = false,
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
  },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        shorting_target = 40,

        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
        }
      },
      require('auto-session-library').current_session_name
    },
  },
}

