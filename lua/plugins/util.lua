return {
  {
    "folke/persistence.nvim",
    keys = function()
      -- stylua: ignore
      return {
        { "<leader>;s", function() require("persistence").select() end, desc = "Session" },
      }
    end,
  },
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = "Nerdy",
    keys = {
      { "<leader>;n", "<CMD>Nerdy list<CR>", desc = "Nerdy" },
    },
    opts = {
      max_recents = 30,
      add_default_keybindings = false,
      copy_to_clipboard = false,
    },
  },
}
