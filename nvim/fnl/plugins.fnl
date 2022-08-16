(module plugins
  {require-macros [hibiscus.packer hibiscus.vim]})

(local open-fn
  (lambda []
    (let [util (require "packer.util")]
      (util.float { :border "rounded"}))))

(packer-setup {:display {:open_fn open-fn}})

(packer
  ;; Fennel integration
  (use! :Olical/aniseed)
  (use! :Olical/conjure)
  (use! :udayvir-singh/hibiscus.nvim)

  ;; Git in the gutter
  (use! :lewis6991/gitsigns.nvim
        :module "config.plugins.gitsigns")

  ;; General
  (use! :terrortylor/nvim-comment)
  (use! :axelf4/vim-strip-trailing-whitespace)
  (use! :machakann/vim-highlightedyank)
  (use! :dag/vim-fish)

  ;; Auto pair
  (use! :gpanders/nvim-parinfer)
  (use! :windwp/nvim-autopairs
        :module "nvim-autopairs.completion.cmp")

  ;; Easy motion
  (use! :phaazon/hop.nvim
        :branch "v2")

  ;; Completion
  (use! :hrsh7th/cmp-buffer)
  (use! :hrsh7th/cmp-path)
  (use! :hrsh7th/cmp-nvim-lsp)
  (use! :hrsh7th/nvim-cmp)
  (use! :L3MON4D3/LuaSnip)
  (use! :github/copilot.vim)

  ;; LSP
  (use! :neovim/nvim-lspconfig
        :module "config.plugins.lsp")

  ;; Treesitter
  (use! :nvim-treesitter/nvim-treesitter
        :run ":TSUpdate"
        :module "config.plugins.treesitter")

  ;; Overlay term
  (use! :akinsho/toggleterm.nvim
        :module "config.plugins.toggleterm")

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
  (use! :nikolvs/vim-sunbather)
  (use! :Shatur/neovim-ayu)
  (use! :B4mbus/oxocarbon-lua.nvim)
  (use! :folke/tokyonight.nvim)

  ;; Indentation lines
  (use! :lukas-reineke/indent-blankline.nvim)

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

(augroup! :packer_user_config
  [[BufWritePost] */plugins.fnl "silent! AniseedEvalFile <afile>"]
  [[BufWritePost] */plugins.fnl "silent! PackerSync"])
