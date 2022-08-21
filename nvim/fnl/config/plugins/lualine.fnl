(local lualine (require :lualine))
(local theme (require :lualine.themes.codedark))
(local auto-session (require :auto-session-library))

(local colours {})

(set colours.black "#282828")
(set colours.white "#ffffff")
(set colours.red "#fb4934")
(set colours.green "#8ebd6b")
(set colours.blue "#83a598")
(set colours.yellow "#e6db74")
(set colours.gray "#a89984")
(set colours.darkgray "#3c3836")
(set colours.lightgray "#504945")
(set colours.inactivegray "#7c6f64")

(set theme.normal.a.fg colours.white)
(set theme.normal.a.bg nil)
(set theme.insert.a.fg colours.green)
(set theme.insert.a.bg nil)
(set theme.replace.a.fg colours.red)
(set theme.replace.a.bg nil)
(set theme.visual.a.bg nil)
(set theme.visual.a.fg colours.yellow)
(set theme.normal.b.bg nil)
(set theme.insert.b.bg nil)
(set theme.insert.b.fg colours.darkgray)
(set theme.replace.b.bg nil)
(set theme.normal.b.fg colours.darkgray)
(set theme.visual.b.bg nil)
(set theme.visual.b.fg colours.darkgray)
(set theme.normal.c.fg colours.darkgray)
(set theme.normal.c.bg nil)
(set theme.insert.c.fg colours.darkgray)
(set theme.insert.c.bg nil)
(set theme.replace.c.bg nil)
(set theme.replace.c.fg colours.darkgray)

(local config {})

(set config.options {})
(set config.options.theme theme)
(set config.options.icons_enabled false)
(set config.options.section_separators { :left "" :right ""})
(set config.options.component_separators { :left "" :right ""})

(set config.sections {})
(set config.sections.lualine_c
      [{1 "filename"
        :file_status true
        :path 1
        :shorting_target 40
        :symbols { :modified "[+]" :readonly "[-]" :unnamed "[No Name]"}}
       auto-session.current_session_name])

(lualine.setup config)

