(local session (require :auto-session))
(session.setup {:log_level :error})

(local ncomment (require :nvim_comment))
(ncomment.setup)

(local hop (require :hop))
(hop.setup {:keys "etovxqpdygfblzhckisuran"})

(local cmp (require :cmp))

(local cmp-mappings
  {"<TAB>" (cmp.mapping.select_next_item)
   "<S-TAB>" (cmp.mapping.select_prev_item)})

(cmp.setup
  {:mapping (cmp.mapping.preset.insert cmp-mappings)
   :sources (cmp.config.sources
              [{:name "nvim_lsp"}
               {:name "nvim_lua"}
               {:name "buffer"}
               {:name "path"}])
   :snippet {:expand (lambda [args]
                       (let [luasnip (require :luasnip)]
                         (luasnip.lsp_expand args.body)))}})

