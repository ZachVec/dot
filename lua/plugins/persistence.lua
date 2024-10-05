return {
  "folke/persistence.nvim",
  -- stylua: ignore
  keys = function ()
    return {
      { "<leader>;s", function() require("persistence").select() end, desc = "Session" },
    }
  end
,
}
