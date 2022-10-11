local set_highlight = require("utils").set_highlight

set_highlight("IndentBlanklineIndent1", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent2", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent3", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent4", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent5", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineIndent6", { fg = "#1f1f1e", bg = "NONE" })
set_highlight("IndentBlanklineContextChar", { fg = "Grey", bg = "NONE" })

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
