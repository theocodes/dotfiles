(require-macros :hibiscus.packer)
(import-macros {: augroup!} :hibiscus.vim)

(packer-setup {})

; (augroup! :packer_user_config
;   [[BufWritePost] [init.fnl] "FnlFile init.fnl | PackerSync"])

;; BufWritePost plugins.lua source <afile> | PackerSync

(packer
  ;; Fennel integration
  (use! :Olical/conjure)
  (use! :bakpakin/fennel.vim)
  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim
        :requires ["udayvir-singh/tangerine.nvim"])

  ;; General
  (use! :terrortylor/nvim-comment)

  ;; Fuzzy finder
  (use! :ibhagwan/fzf-lua
        :requires ["kyazdani42/nvim-web-devicons"])
  (use! :maxjacobson/vim-fzf-coauthorship
        :requires ["junegunn/fzf"])

  ;; Colorschemes
  (use! :chriskempson/base16-vim)
  (use! :Yazeed1s/minimal.nvim)

  ;; Better tabs
  (use! :noib3/nvim-cokeline)

  ;; File browser
  (use! :nvim-neo-tree/neo-tree.nvim
        :branch "v2.x"
        :requires ["nvim-lua/plenary.nvim" "kyazdani42/nvim-web-devicons" "MunifTanjim/nui.nvim"]))


(require :config.options)
(require :config.keymaps)
(require :config.ui)
(require :config.editing)

(require :config.plugins.cokeline)
