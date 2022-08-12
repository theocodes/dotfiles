(module plugins
  {require {: packer}})

(defn- dependencies [use]
  ;; let packer self-manage
  (use :wbthomason/packer.nvim)

  ;; general
  (use :terrortylor/nvim-comment)
  (use :axelf4/vim-strip-trailing-whitespace)
  (use :machakann/vim-highlightedyank)
  (use :dag/vim-fish)
  (use :jiangmiao/auto-pairs)
  (use :lewis6991/gitsigns.nvim)

  ;; file browser
  (use {1 :nvim-neo-tree/neo-tree.nvim
        :branch "v2.x"
        :requires ["nvim-lua/plenary.nvim" "kyazdani42/nvim-web-devicons" "MunifTanjim/nui.nvim"]})

  ;; fuzzy finder
  (use {1 :ibhagwan/fzf-lua
        :requires ["kyazdani42/nvim-web-devicons"]})
  (use {1 :maxjacobson/vim-fzf-coauthorship
        :requires ["junegunn/fzf"]})

  ;; colorschemes
  (use :chriskempson/base16-vim)
  (use :Shatur/neovim-ayu)

  ;; treesitter
  (use {1 :nvim-treesitter/nvim-treesitter :run ":TSUpdate" })

  ;; session management
  (use :rmagatti/auto-session)

  ;; better tabs
  (use :noib3/nvim-cokeline)

  ;; status line
  (use {1 :nvim-lualine/lualine.nvim
        :requires ["kyazdani42/nvim-web-devicons"]})

  ;; overlay term
  (use :akinsho/toggleterm.nvim)

  ;; easy motion
  (use {1 :phaazon/hop.nvim
        :branch "v2"})

  ;; fennel integration
  (use :Olical/aniseed)
  (use :Olical/conjure))

(packer.startup dependencies)

;; require configs here
;; TODO find a way to autoload configs
(require :config.plugins.neotree)
(require :config.plugins.nvim-comment)
(require :config.plugins.hop)
(require :config.plugins.session)
(require :config.plugins.lualine)
(require :config.plugins.cokeline)
(require :config.plugins.fzf)
(require :config.plugins.treesitter)
