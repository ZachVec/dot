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
        { "<leader>d", group = "debug", icon = { icon = " ", color = "red" } },
        { "<leader>da", icon = { icon = " ", color = "green" } },
        { "<leader>db", icon = { icon = " ", color = "red" } },
        { "<leader>dB", icon = { icon = " ", color = "azure" } },
        { "<leader>dc", icon = { icon = " ", color = "green" } },
        { "<leader>dC", icon = { icon = " ", color = "green" } },
        { "<leader>di", icon = { icon = "󰆹 ", color = "green" } },
        { "<leader>do", icon = { icon = "󰆸 ", color = "green" } },
        { "<leader>dO", icon = { icon = " ", color = "green" } },
        { "<leader>dP", icon = { icon = " ", color = "green" } },
        { "<leader>dt", icon = { icon = " ", color = "green" } },
        { "<leader>de", hidden = true },
        { "<leader>dg", hidden = true },
        { "<leader>dl", hidden = true },
        { "<leader>dw", hidden = true },
        { "<leader>dp", hidden = true },
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
