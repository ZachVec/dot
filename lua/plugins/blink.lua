return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<C-n>"] = { "snippet_forward", "fallback" },
      ["<C-p>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      list = {
        selection = {
          preselect = true,
        },
      },
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" } },
    },
    signature = { window = { border = "single" } },
  },
}
