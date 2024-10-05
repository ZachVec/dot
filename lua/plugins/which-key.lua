-- local icons = { " ", " ", " ", " ", " ", " ", " ", " ", "󰒲 ", " ", "󰗚 " }
return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.spec = {
      {
        mode = { "n", "v" },
        { "<leader>wm", hidden = true },
        { "<leader>c", group = "Code" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>/", group = "Grep", icon = " " },
        { "<leader>;", group = "List", icon = " " },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
      },
    }
  end,
}
