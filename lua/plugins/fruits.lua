return {
  {
    "ZachVec/fruits.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      -- available colors: charcoal yellow menthe purple red green blue pink latte brown
      { "<leader>hh", function () require("fruits").highlight:set("Pink") end, mode = { "n", "v" }, desc = "highlight" },
      { "<leader>hd", function () require("fruits").highlight:reset() end, mode = { "n", "v" }, desc = "remove" },
    },
    opts = {
      highlight = {
        enable = true,
      },
      mark = {
        enable = true,
      },
    },
    dev = false,
    enabled = false,
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = function(_, opts)
  --     opts.mark = {}
  --     table.insert(opts.sources, "mark")
  --     return opts
  --   end,
  -- },
  {
    "ZachVec/neo-tree-mark.nvim",
    dependencies = {
      { "nvim-neo-tree/neo-tree.nvim" },
      { "ZachVec/fruits.nvim" },
    },
    -- stylua: ignore
    keys = {
      { "<leader>ma", function () require("neo-tree.sources.mark"):create_mark() end, desc = "Create Mark at cursor" },
      { "<leader>em", function () require("neo-tree.command").execute({ source = "mark", toggle = true }) end, desc = "Mark Explorer" }
    },
    dev = false,
    enabled = false,
  },
}
