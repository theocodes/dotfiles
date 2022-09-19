(local session (require :auto-session))
(local ncomment (require :nvim_comment))
(local hop (require :hop))
(local npairs (require :nvim-autopairs))
(local cmp (require :cmp))
(local lines (require :indent_blankline))

;; sessions
(session.setup
  {:log_level "info"
   :auto_session_suppress_dirs ["~/" "~/Projects"]})

;; commenting
(ncomment.setup)

;; Enable easy motion with 's'
(hop.setup { :keys "etovxqpdygfblzhckisuran"})

;; Enable autopairing
(npairs.setup { :check_ts true})
(npairs.add_rules (require "nvim-autopairs.rules.endwise-lua"))

;; Enable autocompletion
(set vim.opt.completeopt ["menu" "menuone" "noselect"])
(local cmp-autopairs (require "nvim-autopairs.completion.cmp"))

(cmp.setup
  {:mapping
   (cmp.mapping.preset.insert
     {"<C-f>" (cmp.mapping.confirm { :select true})
      "<C-c>" (cmp.mapping.abort)
      "<TAB>" (cmp.mapping.select_next_item)
      "<S-TAB>" (cmp.mapping.select_prev_item)})

   :sources (cmp.config.sources [{:name "nvim_lsp"}
                                 {:name "orgmode"}
                                 {:name "luasnip"}
                                 {:name "conjure"}] [{:name "buffer"}])

   :snippet
   {:expand
    (lambda [args]
     (let [luasnip (require :luasnip)]
       (luasnip.lsp_expand args.body)))}})

(cmp.event:on "confirm_done" cmp-autopairs.on_confirm_done { :map_char { :tex ""}})

;; Configure indentation lines
(lines.setup
  {:show_current_context true
   :show_current_context_start true
   :char_highlight_list
    ["IndentBlanklineIndent1"]})

