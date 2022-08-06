(local module { :plugins [] })

(fn module.add [plugin]
  "Adds plugin to install list"
  (table.insert module.plugins plugin))

(fn module.init []
  (require :paq module.plugins))

module
