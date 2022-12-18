(require-macros :hibiscus.packer)
(require-macros :hibiscus.vim)

(local open-fn
  (lambda []
    (let [util (require "packer.util")]
      (util.float { :border "rounded"}))))

(packer-setup {:display {:open_fn open-fn}})

(packer
  ;; general
  (use! :terrortylor/nvim-comment)
  (use! :axelf4/vim-strip-trailing-whitespace)
  (use! :machakann/vim-highlightedyank)
  (use! :dag/vim-fish)
  (use! :folke/which-key.nvim)
  (use! :tpope/vim-fugitive)
  (use! :tpope/vim-rhubarb)
  (use! :tpope/vim-eunuch)
  (use! :nvim-lua/plenary.nvim)
  (use! :github/copilot.vim)
  (use! :gpanders/nvim-parinfer)
  (use! :lewis6991/gitsigns.nvim)
  (use! :windwp/nvim-autopairs)
  (use! :lukas-reineke/indent-blankline.nvim)
  (use! :sbdchd/neoformat)
  ; (use! :ruby-formatter/rufo-vim)

  ;; tabs
  (use! :akinsho/bufferline.nvim
        :tag "v2.*"
        :requires ["kyazdani42/nvim-web-devicons"])

  ;; easy motion
  (use! :phaazon/hop.nvim
        :branch "v2")

  ;; colorscheme
  (use! :catppuccin/nvim :as "catppuccin")

  ;; session management
  (use! :rmagatti/auto-session)

  ;; prettier statusbar
  (use! :nvim-lualine/lualine.nvim
        :requires ["kyazdani42/nvim-web-devicons"])

  ;; lsp
  (use! :neovim/nvim-lspconfig)

  ;; file explorer
  (use! :nvim-neo-tree/neo-tree.nvim
        :branch "v2.x"
        :requires ["nvim-lua/plenary.nvim" "kyazdani42/nvim-web-devicons" "MunifTanjim/nui.nvim"])

  ;; fzf integration
  (use! :ibhagwan/fzf-lua
        :requires ["kyazdani42/nvim-web-devicons"])
  (use! :maxjacobson/vim-fzf-coauthorship
        :requires ["junegunn/fzf"])

  ;; treesitter
  (use! :nvim-treesitter/nvim-treesitter
        :run (lambda []
               (let [ts (require "nvim-treesitter.install")]
                 (ts.update {:with_sync true}))))

  ;; autocompletion
  (use! "hrsh7th/cmp-buffer")
  (use! "hrsh7th/cmp-path")
  (use! "hrsh7th/cmp-nvim-lsp")
  (use! "hrsh7th/nvim-cmp")
  (use! "L3MON4D3/LuaSnip")

  ;; package manager
  (use! :williamboman/mason.nvim)

  ;; floating terminal
  (use! :akinsho/toggleterm.nvim)

  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim)
  (use! :atweiden/vim-fennel))

(augroup! :packer_user_config
  [[BufWritePost] */plugins.fnl "silent! FnlFile <afile>"]
  [[BufWritePost] */plugins.fnl "silent! PackerSync"])

nil
