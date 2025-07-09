return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- fix lualine broken on snacks_dashboard, check these out.
      -- https://github.com/nvim-lualine/lualine.nvim/issues/1401
      -- https://github.com/folke/tokyonight.nvim/issues/703
      on_colors = function(c)
        c.bg_statusline = c.none
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
