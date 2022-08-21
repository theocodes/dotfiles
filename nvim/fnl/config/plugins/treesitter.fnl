(local configs (require "nvim-treesitter.configs"))

(configs.setup
  {:ensure_installed ["lua" "fennel" "ruby" "org"]
   :sync_install false
   :ignore_install {}
   :highlight
    {:enable true
     :disable []
     :additional_vim_regex_highlighting ["org"]}

   :indent {:enable true :disable ["yaml"]}})
