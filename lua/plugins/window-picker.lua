return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
    },
    opts = {
      hint = "floating-big-letter",
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify", "snacks_notif" },
          buftype = { "terminal", "quickfix" },
        },
      },
      show_prompt = false,
    },
  },
}
