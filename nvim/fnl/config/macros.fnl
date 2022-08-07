(require-macros :hibiscus.vim)

(lambda quote? [x]
  "checks if 'x' is quoted value."
  (let [ref (?. x 1 1)]
    (= ref :quote)))

(lambda parse-sym [xs]
  "parses symbol 'xs' converts it to string if not a variable."
  (if (or (in-scope? xs) (not (sym? xs)))
      (do xs)
      (tostring xs)))

(lambda parse-cmd [xs ...]
  "parses command 'xs', wrapping it in function if quoted."
  (if (quote? xs)
      (let [ref (. xs 2)]
        (if (list? ref) `(fn [] ,ref) ref))
      :else xs))

(lambda parse-map-args [args]
  "parses map 'args' into (modes opts) chunk."
  (let [modes []
        opts  {:silent true}]
    ; parse modes
    (each [mode (string.gmatch (tostring (table.remove args 1)) ".")]
      (table.insert modes mode))
    ; parse options
    (each [_ key (ipairs args)]
      (if (= key :verbose)
          (tset opts :silent false)
          (tset opts key true)))
    :return
    (values modes opts)))

(fn hi! [name opts]
  `(vim.api.nvim_set_hl 0 ,(parse-sym name) ,opts))

(fn leader! [args lhs rhs ?desc]
  "defines vim keymap for modes in 'args'."
  (assert-compile (. args 1)
    "map: missing required argument 'mode'." args)
  (local (modes opts) (parse-map-args args))
  (set opts.desc ?desc)
  :return
  `(vim.keymap.set ,modes ,(.. "<Leader>" lhs) ,(parse-cmd rhs) ,opts))

{:hi! hi!
 :leader! leader!}
