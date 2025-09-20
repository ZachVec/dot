return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- stylua: ignore
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.stdpath("config") .. "/extras/markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
