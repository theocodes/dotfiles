
(fn split [input sep]
  "Returns a table of strings split by sep."
  (let [pattern (.. "([^" sep "]+)")
        result []]
    (each [str (string.gmatch input pattern)]
      (table.insert result str))
    result))

(fn get-datetime []
  "Return the current datetime in the following format: YYYY-MM-DD HH:MM:SS"
  (vim.fn.system "date '+%Y-%m-%d %H:%M:%S'"))

(fn get-timestamp [datetime]
  "Returns the current datetime in the timestamp format: YYYYMMDDHHMMSS"
  (-> datetime
      (string.gsub "-" "")
      (string.gsub ":" "")
      (string.gsub "\n" "")
      (string.gsub " " "")))

(fn format-title [title]
  "Returns the title in lowercase with spaces and special characters removed."
  (-> title
      (string.gsub "  *" "_")
      (string.lower)))

(fn format-tags [tags]
  "Takes a table of tags and returns a string of tags separated by hyphens."
  (table.concat tags "-"))

(fn process-tags [str]
  "Returns a table of tags from the given string."
  (-> str
      (string.gsub "," " ")
      (split " ")))

(fn get-filename [datetime title tags]
  (let [timestamp (get-timestamp datetime)
        formatted-title (format-title title)
        formatted-tags (format-tags tags)
        filename (string.format "%s--%s--%s.md" timestamp formatted-title formatted-tags)]
    filename))

(fn create-note []
  "Creates a new note for the current day."
  (let [title (vim.fn.input "Enter a title: ")
        tags (vim.fn.input "Enter tags (comma separated): ")
        datetime (get-datetime)
        filename (get-filename datetime title (process-tags tags))]
    (print filename)))

;; placeholder testing

(fn assert [expected input]
  (if (not= input expected)
    (vim.api.nvim_err_writeln
      (.. "expected: '" expected "' got: '" input "'"))))

(assert "20220810210420" (get-timestamp "2022-08-10 21:04:20"))

(assert "this_is_my_title" (format-title "This is my title"))
(assert "this_is_my_other_title" (format-title "This is my other   title"))

(assert "testing-hello-world" (format-tags ["testing" "hello" "world"]))

(assert "20220810210420--my_test_note--test-notes.md"
        (get-filename "2022-08-10 21:04:20" "My Test Note" ["test" "notes"]))

; (create-note)
