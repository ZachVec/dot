return {
  {
    dir = "~/playground/track.nvim",
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
    },
    keys = {
      {
        "<leader>et",
        function()
          require("neo-tree.command").execute({
            source = "backtrace",
            toggle = true,
          })
        end,
        desc = "TrackExplorer",
      },
      {
        "<leader>;f",
        function()
          require("neo-tree.sources.backtrace").sel_flow()
        end,
        desc = "select workflow",
      },
      {
        "<leader>;a",
        function()
          require("neo-tree.sources.backtrace").add_mark()
        end,
        desc = "add mark",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      table.insert(opts.sources, "backtrace")
      opts.backtrace = {
        window = {
          mappings = {
            ["Y"] = "noop",
            ["O"] = "noop",
            ["l"] = "noop",
            ["h"] = "noop",
            ["P"] = "noop",
          }
        }
      }
      return opts
    end,
  },
}
