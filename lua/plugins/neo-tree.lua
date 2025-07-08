return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = function()
    -- stylua: ignore
    return {
      {
        "<leader>ef",
        function()
          require("neo-tree.command").execute({ source = "filesystem", toggle = true, dir = LazyVim.root() })
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
      {
        "<leader>es",
        function()
          require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
        end,
        desc = "Symbol Explorer",
      },
    }
  end,
  opts = function(_, opts)
    table.insert(opts.sources, "document_symbols")
    opts = vim.tbl_deep_extend("force", opts, {
      default_component_configs = {
        indent = {
          indent_size = 1,
        },
      },
      source_selector = {
        sources = {
          { source = "filesystem" },
          { source = "document_symbols" },
        },
        winbar = true,
        statusline = false,
      },
    })
    return opts
  end,
}
