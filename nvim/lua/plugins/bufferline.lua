local set_highlight = require("utils").set_highlight
local get_highlight = require("utils").get_highlight

require("bufferline").setup{
  options = {
    show_buffer_close_icons = false,
    show_buffer_icons = false,
    separator_style = "thin",
    buffer_close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    modified_icon = "",
    show_modified_icon = false,
    max_name_length = 20,
    diagnostics = "nvim_lsp",
    tab_size = 0,
    indicator = {
      style = "none",
    }
  }
}

set_highlight('BufferlineFill', { bg = "NONE" })
set_highlight('BufferlineBufferSelected', { bg = "NONE", italic = false, bold = true })

set_highlight('BufferlineHintSelected', {
  bg = "NONE",
  fg = get_highlight("BufferlineHintSelected").foreground,
  italic = false,
  bold = true
})

set_highlight('BufferlineErrorSelected', {
  bg = "NONE",
  fg = get_highlight("BufferlineErrorSelected").foreground,
  italic = false,
  bold = true
})

set_highlight('BufferlineWarningSelected', {
  bg = "NONE",
  fg = get_highlight("BufferlineWarningSelected").foreground,
  italic = false,
  bold = true
})
