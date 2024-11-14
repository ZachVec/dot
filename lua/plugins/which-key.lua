-- Find More Icons Here! https://www.nerdfonts.com/cheat-sheet
return {
  "folke/which-key.nvim",
  keys = {
    { "<leader>?", false },
    {
      "<leader>;k",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps",
    },
  },
  opts = function(_, opts)
    opts.spec = {
      {
        mode = { "n", "v" },
        { "<leader>w", hidden = true },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>/", group = "grep", icon = " " },
        { "<leader>;", group = "list", icon = " " },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "cyan" } },
        { "<leader>e", group = "explorer", icon = { icon = "󰖟 ", color = "cyan" } },
        { "<leader>m", group = "message", icon = { icon = "󰍦 ", color = "cyan" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
      },
    }
  end,
}
