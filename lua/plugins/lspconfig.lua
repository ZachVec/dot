return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers.pyright = {}
    opts.servers.clangd = {
      -- cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
      cmd = { "clangd", "--background-index", "--clang-tidy" },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      init_options = {
        fallbackFlags = { "-std=c++17" },
      },
    }
    opts.servers.protols = {}
  end,
}
