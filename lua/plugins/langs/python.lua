return {
  {
    "mfussenegger/nvim-dap-python",
    keys = {
      { "<leader>dPt", ft = "python", false },
      { "<leader>dPc", ft = "python", false },
    },
  },

  {
    "linux-cultist/venv-selector.nvim",
    enabled = true,
    branch = "main",
    -- stylua: ignore
    keys = {
      { "<leader>cv", false },
      { "<leader>;v", "<cmd>:VenvSelect<cr>", desc = "VirtualEnv", ft = "python" },
    },
  },
}
