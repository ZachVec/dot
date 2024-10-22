-- local icons = { " ", " ", " ", " ", " ", " ", " ", " ", "󰒲 ", " ", "󰗚 " }
return {
  "folke/which-key.nvim",
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
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "<leader>K", icon = "󰗚 " }
      },
    }
  end,
}
