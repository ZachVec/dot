return {
  {
    "linux-cultist/venv-selector.nvim",
    enabled = true,
    branch = "main",
    -- stylua: ignore
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = { "n", "c", "t", "i" },
      -- This disables rendering on cursor line
      anti_conceal = {
        enabled = true,
        -- disabled_modes = { "n" }, -- modes to enable rendering on cursor line
        ignore = { -- elements always rendering dispite of options above
          bullet = true,
          code_language = false,
          dash = true,
          head_background = true,
          head_border = true,
          head_icon = true,
          quote = true,
        },
      },
      win_options = {
        concealcursor = {
          -- rendered = "nvc",
        },
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
      -- stylua: ignore
      custom = {
        cancel = { raw = '[/]', rendered = '󰜺 ', highlight = "RenderMarkdownH8Fg", scope_highlight = nil }
      },
      },
      code = {
        width = "full",
      },
      completions = {
        blink = { enabled = true },
        lsp = { enabled = true },
      },
    },
  },
}
