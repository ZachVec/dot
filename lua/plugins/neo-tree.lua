return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = function()
    return {
      {
        "<leader>ef",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>eg",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>eb",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer Explorer",
      },
      -- {
      --   "<leader>es",
      --   function()
      --     require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
      --   end,
      --   desc = "Symbol Explorer",
      -- },
    }
  end,
  -- opts = function (_, opts)
  --   table.insert(opts.sources, "document_symbols")
  -- end
}
