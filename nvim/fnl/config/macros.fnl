(import-macros {: map!} :hibiscus.vim)

(lambda parse-sym [xs]
  "parses symbol 'xs' converts it to string if not a variable."
  (if (or (in-scope? xs) (not (sym? xs)))
      (do xs)
      (tostring xs)))

(fn hi! [name opts]
  `(vim.api.nvim_set_hl 0 ,(parse-sym name) ,opts))

(fn leader! [args lhs rhs ?desc]
  "defines vim keymap for modes in 'args' in leader."
  (map! args (.. "<Leader>" lhs) rhs ?desc))

{:hi! hi!
 :leader! leader!}