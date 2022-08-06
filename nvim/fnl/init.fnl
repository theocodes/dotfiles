(local options (require :config.options))
(local keybindings (require :config.keybindings))
(local ui (require :config.ui))
(local plugins (require :config.plugins))

(options.init)
(keybindings.init)
(ui.init)

(plugins.add "savq/paq-nvim")
(plugins.add "rktjmp/hotpot.nvim")
(plugins.add "bakpakin/fennel.vim")

(plugins.init)
