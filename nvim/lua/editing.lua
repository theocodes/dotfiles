local session = require("auto-session")
local ncomment = require("nvim_comment")
local hop = require("hop")
local cmp = require("cmp")

session.setup {
  log_level = "error"
}

-- comment with gc/gcc
ncomment.setup()

-- easy motion
hop.setup {
  keys = "etovxqpdygfblzhckisuran"
}

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ["<C-return>"] = cmp.mapping.confirm({ select = true }),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources(
  {
    { name = "nvim_lsp" }
  },
  {
    { name = "buffer" }
  }),
  snippet = {
    expand = function(args)
      local luasnip = require("luasnip")
      luasnip.lsp_expand(args.body)
    end
  }
}

