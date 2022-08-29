(require-macros :hibiscus.packer)
(import-macros {: augroup!} :hibiscus.vim)

(local open-fn
  (lambda []
    (let [util (require "packer.util")]
      (util.float { :border "rounded"}))))

(packer-setup {:display { :open_fn open-fn}})

(packer
  ;; Fennel integration
  (use! :bakpakin/fennel.vim)
  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim)

  ;; Git in the gutter
  (use! :lewis6991/gitsigns.nvim
        :module "config.plugins.gitsigns")

  ;; General
  (use! :terrortylor/nvim-comment)
  (use! :axelf4/vim-strip-trailing-whitespace)
  (use! :machakann/vim-highlightedyank)
  (use! :dag/vim-fish)
  (use! :folke/which-key.nvim)
  (use! :tpope/vim-fugitive)
  (use! :tpope/vim-eunuch)
  (use! :akinsho/toggleterm.nvim)
  (use! :nvim-lua/plenary.nvim)

  ;; Completion
  (use! :hrsh7th/cmp-buffer)
  (use! :hrsh7th/cmp-path)
  (use! :hrsh7th/cmp-nvim-lsp)
  (use! :hrsh7th/nvim-cmp)
  (use! :L3MON4D3/LuaSnip)
  ; (use! :github/copilot.vim)

  ;; LSP
  (use! :neovim/nvim-lspconfig
        :module "config.plugins.lsp")

  ;; Fuzzy finder
  (use! :ibhagwan/fzf-lua
        :requires ["kyazdani42/nvim-web-devicons"]
        :module "config.plugins.fzf")
  (use! :maxjacobson/vim-fzf-coauthorship
        :requires ["junegunn/fzf"])

  ;; Auto pair
  (use! :gpanders/nvim-parinfer)
  (use! :windwp/nvim-autopairs
        :module "nvim-autopairs.completion.cmp")

  ;; Easy motion
  (use! :phaazon/hop.nvim
        :branch "v2")

  ;; Colorschemes
  (use! :ishan9299/modus-theme-vim)
  (use! :ray-x/starry.nvim)

  ;; Indentation lines
  (use! :lukas-reineke/indent-blankline.nvim)

  ;; Session management
  (use! :rmagatti/auto-session)

  ;; Better tabs
  (use! :noib3/nvim-cokeline
        :module "config.plugins.cokeline")

  ;; buffer line
  (use! :nvim-lualine/lualine.nvim
        :requires ["kyazdani42/nvim-web-devicons"]
        :module "config.plugins.lualine")

  ;; Treesitter
  (use! :nvim-treesitter/nvim-treesitter
        :run ":TSUpdate"
        :module "config.plugins.treesitter")

  ;; File browser
  (use! :nvim-neo-tree/neo-tree.nvim
        :branch "v2.x"
        :requires ["nvim-lua/plenary.nvim" "kyazdani42/nvim-web-devicons" "MunifTanjim/nui.nvim"]
        :module "config.plugins.neotree")

  ;; Note taking
  (use! "phaazon/mind.nvim"
        :branch "v2"
        :requires ["nvim-lua/plenary.nvim"]
        :module "config.plugins.mind")

  (use! "~/Code/notery"))

(augroup! :packer_user_config
  [[BufWritePost] "*/plugins.fnl" '(do
                                    (vim.cmd ":FnlFile <afile>")
                                    (vim.cmd ":PackerSync"))])

nil ; supress output
