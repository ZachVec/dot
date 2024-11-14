return {
  "gbprod/yanky.nvim",
  keys = {
    { "<leader>p", false },
    {
      "<leader>;p",
      function()
        if LazyVim.pick.picker.name == "telescope" then
          require("telescope").extensions.yank_history.yank_history({})
        else
          vim.cmd([[YankyRingHistory]])
        end
      end,
      mode = { "n", "x" },
      desc = "Yank History",
    },
  }
}
