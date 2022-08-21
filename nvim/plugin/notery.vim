" Used for development of Notery
"
" The plugin will get re-compiled and re-loaded into the current
" session when the notery/init.fnl file is saved to help with the feedback
" loop.

fun! ReloadAndOpen()
  lua for k in pairs(package.loaded) do if k:match("^notery") then package.loaded[k] = nil end end
  lua require("notery").init()
  lua vim.api.nvim_command("Notery")
endfun

command! -nargs=0 NoteryDevOpen :call ReloadAndOpen()
