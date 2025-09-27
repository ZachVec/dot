--- @type LazyPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- stylua: ignore
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
        pyright = {
          settings = {
            pyright = {
              disableTaggedHints = true,
            },
          },
        },
      },
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    keys = {
      { "<leader>cm", false },
    },
    opts = function()
      return {
        ensure_installed = {}, --- NOTE: manually installed binaries imcompatible with older glibc.
        ui = {
          border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }, -- stylua: ignore
        },
      }
    end,
  },
}
