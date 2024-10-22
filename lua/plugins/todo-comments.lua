return {
  "folke/todo-comments.nvim",
  keys = {
    { "<leader>st", false },
    { "<leader>sT", false },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  }
}
