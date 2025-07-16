return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    render_modes = { "n", "c", "t", "i" },
    anti_conceal = {
      -- 不要渲染光标所在行
      enabled = true,
      -- 在以下模式中，在光标所在行继续渲染
      disabled_modes = { "n" },
    },
    heading = {
      -- stylua: ignore
      -- icons = { "󰇊 ", "󰇋 ", "󰇌 ", "󰇍 ", "󰇎 ", "󰇏 " },
      icons = { " ", " ", " ", " ", " ", " " },
    },
    checkbox = {
      enabled = true,
      -- bullet = true,
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
