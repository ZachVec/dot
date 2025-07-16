return {
  "folke/noice.nvim",
  -- stylua: ignore
  keys = function ()
   return {
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  }
  end,
  opts = {
    presets = {
      lsp_doc_border = true,
    },
  },
}
