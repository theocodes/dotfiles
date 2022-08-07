local present, cokeline = pcall(require, "cokeline")
if not present then
  return
end

local get_hex = require('cokeline/utils').get_hex

cokeline.setup({
  show_if_buffers_are_at_least = 1,

  mappings = {
    cycle_prev_next = true,
  },

  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
    end,
    bg = "NONE",
    style = function(buffer)
      return buffer.is_focused and "bold" or nil
    end,
  },

  components = {
    {
      text = function(buffers) return " " end,
    },
    {
      text = function(buffer)
        return buffer.unique_prefix
      end,
      fg = function(buffer)
        return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
      end,
      style = "italic",
    },
    {
      text = function(buffer)
        return buffer.filename
      end,
      style = function(buffer)
        return buffer.is_focused and "bold" or nil
      end,
    },
    {
      text = function(buffer)
        return buffer.is_modified and " ●" or ""
      end,
      fg = function(buffer)
        return buffer.is_focused and get_hex('Normal', 'fg')
      end,
    },
    {
      text = " ",
    },
  },
})
