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
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
      show_prompt = false,
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      if LazyVim.has("window-picker") then
        opts = vim.tbl_deep_extend("force", opts, {
          window = {
            mappings = {
              ["<cr>"] = "open_with_window_picker",
            },
          },
        })
      end
      return opts
    end,
  },
}
