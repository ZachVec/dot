--- @type LazyPluginSpec[]
return {
  {
    "linux-cultist/venv-selector.nvim",
    enabled = true,
    branch = "main",
    keys = {
      { "<leader>cv", false },
      { "<leader>;v", "<cmd>:VenvSelect<cr>", desc = "VirtualEnv", ft = "python" }
    }
    -- opts = function()
    --   return {
    --     options = {
    --       notify_user_on_venv_activation = false,
    --     },
    --   }
    -- end,
  },
}
