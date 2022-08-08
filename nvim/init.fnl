(require-macros :hibiscus.packer)

(packer-setup {})

(packer
  ;; Fennel integration
  (use! :Olical/conjure)
  (use! :bakpakin/fennel.vim)
  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim
        :requires ["udayvir-singh/tangerine.nvim"])

  ;; Git in the gutter
  (use! :lewis6991/gitsigns.nvim
        :module "config.plugins.gitsigns")

  ;; General
  (use! :terrortylor/nvim-comment)

  ;; line
  (use! :nvim-lualine/lualine.nvim
        :requires ["kyazdani42/nvim-web-devicons"]
        :module "config.plugins.lualine")

  ;; Fuzzy finder
  (use! :ibhagwan/fzf-lua
        :requires ["kyazdani42/nvim-web-devicons"]
        :module "config.plugins.fzf")
  (use! :maxjacobson/vim-fzf-coauthorship
        :requires ["junegunn/fzf"])

  ;; Colorschemes
  (use! :chriskempson/base16-vim)
  (use! :Yazeed1s/minimal.nvim)

  ;; Session management
  (use! :rmagatti/auto-session
        :module "config.plugins.session")

  ;; Better tabs
  (use! :noib3/nvim-cokeline
        :module "config.plugins.cokeline")

  ;; File browser
  (use! :nvim-neo-tree/neo-tree.nvim
        :branch "v2.x"
        :requires ["nvim-lua/plenary.nvim" "kyazdani42/nvim-web-devicons" "MunifTanjim/nui.nvim"]
        :module "config.plugins.neotree"))


(require :config.options)
(require :config.keymaps)
(require :config.ui)
(require :config.editing)

