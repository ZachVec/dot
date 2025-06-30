return {
  {
    "nvim-neo-tree/example-source",
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
    },
    -- stylua: ignore
    keys = {
      { "<leader>ee", function()
          require("neo-tree.command").execute({ source = "example", toggle = true })
        end,
        desc = "Example explorer",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      table.insert(opts.sources, "example")
      opts.example = {
        renderers = {
          custom = {
            { "indent" },
            { "icon" },
            { "name" },
            { "custom" },
          },
        },
      }
      return opts
    end,
  },
}
