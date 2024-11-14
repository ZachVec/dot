return {
  "ZachVec/tabpicker.nvim",
  events = "VeryLazy",
  keys = {
    { "<leader>;<tab>", "<cmd>lua require('tabpicker').find_tabpages()<cr>", desc = "Tabs" },
  },
  opts = {},
}
