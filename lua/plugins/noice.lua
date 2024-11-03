return {
  "folke/noice.nvim",
  -- stylua: ignore
  keys = function ()
   return {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>ml", function() require("noice").cmd("last") end, desc = "Last Message" },
    { "<leader>mh", function() require("noice").cmd("history") end, desc = "Message History" },
    { "<leader>ma", function() require("noice").cmd("all") end, desc = "All Message" },
    { "<leader>md", function() require("noice").cmd("dismiss") end, desc = "Dismiss Message" },
    { "<leader>mf", function() require("noice").cmd("pick") end, desc = "Search Message" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  }
  end,
}
