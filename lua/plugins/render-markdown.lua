return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    render_modes = { "n", "c", "t", "i" },
    anti_conceal = {
      enabled = true,
      -- disabled_modes = { "n" },
    },
    heading = {
      -- stylua: ignore
      -- icons = { "󰇊 ", "󰇋 ", "󰇌 ", "󰇍 ", "󰇎 ", "󰇏 " },
      icons = { " ", " ", " ", " ", " ", " " },
    },
    checkbox = {
      enabled = true,
      right_pad = 2,
      checked = {
        icon = "󰄳 ",
      },
      unchecked = {
        icon = "󰄰 ",
      },
    },
    code = {
      width = "full",
    },
  },
}
