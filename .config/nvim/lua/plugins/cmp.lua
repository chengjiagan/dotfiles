-- remapping keys for nvim-cmp
return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      require("luasnip") -- make <Tab> available at startup

      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        -- ["<Esc>"] = cmp.mapping.abort(),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
      })
    end,
  },
}
