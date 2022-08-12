(module config.plugins.treesitter
  {require {configs nvim-treesitter.configs}})

(configs.setup {
  :ensure_installed [ "lua" "fennel" "ruby" ]
  :sync_install false
  :ignore_install {}
  :highlight {
    :enable true
    :disable []
    :additional_vim_regex_highlighting true
  }
  :indent { :enable false :disable [ "yaml" ] }
})
