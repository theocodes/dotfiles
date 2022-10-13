local set_highlight = require("utils").set_highlight
local get_highlight = require("utils").get_highlight

require("bufferline").setup{
  options = {
    show_buffer_close_icons = false,
    show_buffer_icons = false,
    show_tab_indicators = true,
    show_modified_icon = false,
    show_duplicate_prefix = false,
    separator_style = "thin",
    name_formatter = function(buf) return "  " .. buf.name end,
    buffer_close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    modified_icon = "",
    max_name_length = 20,
    diagnostics = "nvim_lsp",
    tab_size = 0,
    indicator = {
      icon = "▎",
      style = "icon",
    }
  }
}

set_highlight('BufferlineFill', { bg = "NONE" })
set_highlight('BufferlineBufferSelected', { bg = "NONE", italic = false, bold = true })

local primary = get_highlight("String")

set_highlight('BufferlineIndicatorSelected', {
  bg = "NONE",
  fg = primary.foreground, italic = false, bold = true
})

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
