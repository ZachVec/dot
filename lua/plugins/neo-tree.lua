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
      window = {
        mappings = {
          ["."] = "noop",
          ["b"] = "noop",
          ["f"] = "noop",
          ["h"] = "noop",
          ["i"] = "noop",
          ["l"] = "noop",
          ["o"] = "noop",
          ["z"] = "noop",
          ["O"] = "noop",
          ["C"] = "noop",
          ["oc"] = "noop",
          ["od"] = "noop",
          ["og"] = "noop",
          ["om"] = "noop",
          ["on"] = "noop",
          ["os"] = "noop",
          ["ot"] = "noop",
          ["<bs>"] = "noop",
          ["e"] = "toggle_node",
          ["="] = "toggle_auto_expand_width",
          ["zC"] = "close_all_nodes",
          ["zc"] = "close_node",
          ["zR"] = "expand_all_nodes",
          ["zo"] = "expand_all_subnodes",
        },
      },
      filesystem = {
        window = {
          mappings = {
            ["#"] = "noop",
            ["A"] = "noop",
            ["D"] = "noop",
            ["]g"] = "noop",
            ["[g"] = "noop",
            ["<C-x>"] = "noop",
          },
        },
      },
      buffers = {
        window = {
          mappings = {
            ["bd"] = "noop",
          },
        },
      },
      git_status = {
        window = {
          mappings = {
            ["c"] = "noop",
            ["d"] = "noop",
            ["m"] = "noop",
            ["p"] = "noop",
            ["s"] = "noop",
            ["t"] = "noop",
            ["w"] = "noop",
            ["x"] = "noop",
            ["y"] = "noop",
            ["S"] = "noop",
            ["ga"] = "noop", -- stage
            ["gc"] = "noop", -- commit
            ["gg"] = "noop", -- commit and push
            ["gp"] = "noop", -- push
            ["gr"] = "noop", -- revert
            ["gu"] = "noop", -- unstage
            ["gU"] = "noop", -- Undo last commit
            ["a"] = {
              function(state)
                local gcmd = require("neo-tree.sources.git_status.commands")
                gcmd.git_add_all(state)
              end,
              desc = "git add file",
            },
            ["r"] = {
              function(state)
                local gcmd = require("neo-tree.sources.git_status.commands")
                gcmd.git_revert_file(state)
              end,
              desc = "git restore file",
            },
            ["u"] = {
              function(state)
                local gcmd = require("neo-tree.sources.git_status.commands")
                gcmd.git_unstage_file(state)
              end,
              desc = "git unstage file",
            },
          },
        },
      },
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
