(local denote {})

(fn format-title [title]
  "Formats the provided title string to be used in the filename
  by replacing spaces with underscores and lowercasing everything.
  ie 'My special note' => my-special-note"
  (-> title
      (string.gsub "%s+" "-")
      (string.lower)))

(fn format-tags [tags]
  "Formats the provided table of tags to be used in the filename.
  Tags are joined by '_' and spaces in tags are replaced with a '-'.
  ie ['example' 'with spaces'] => 'example_with-spaces'")


(fn denote.capture-note []
  (let [title (vim.fn.input "Title: " "" "file")
        tags (vim.fn.input "Tags (comma-separated): ")]
    (print tags)))

(fn run [{:args args}]
  (match args
    "note" (denote.capture-note)
    other (print "error: command unknown")))

(fn init []
  "Called when the module is loaded."
  (vim.api.nvim_create_user_command "Notery" run {:nargs :?}))

(init)

:return denote
