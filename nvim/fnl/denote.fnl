(local denote {})

(fn gen-filename [title]
  "Generates the file name based on the provided title.
  The resulting format should look like: `file_name.md`"
  (-> title
      (string.gsub "%s+" "_")
      (string.lower)
      (.. ".md")))

(fn denote.capture-note []
  (let [title ""]
    (print title)))
    ; (vim.ui.input {:prompt "Title: "} (lambda [input] (set title input)))))

(fn run [{:args args}]
  (match args
    "capture-note" (denote.capture-note)
    other (print "error: command unknown")))

(fn init []
  "Called when the module is loaded."
  (vim.api.nvim_create_user_command "Notery" run {:nargs :?}))

(init)

:return denote
