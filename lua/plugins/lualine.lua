return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- return opts
    vim.o.laststatus = vim.g.lualine_laststatus
    table.insert(opts.sections.lualine_x, {
      function()
        return tostring(vim.api.nvim_get_option_value("shiftwidth", {}))
      end,
      icon = "",
    })
    return {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          winbar = { "snacks_dashboard", "neo-tree", "aerial" },
          statusline = { "snacks_dashboard" },
        },
      },
      sections = {
        lualine_a = {
          {
            function()
              local tab_cnt = vim.fn.tabpagenr("$")
              local tab_idx = vim.fn.tabpagenr()
              return tostring(tab_idx) .. "/" .. tostring(tab_cnt)
            end,
            icon = "󰓩",
          },
        },
        lualine_b = opts.sections.lualine_b,
        lualine_c = { LazyVim.lualine.pretty_path({ length = 0 }) },
        lualine_x = opts.sections.lualine_x,
        lualine_y = opts.sections.lualine_y,
        lualine_z = { "lsp_status" },
      },
      winbar = {
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { "filename", path = 0 },
          { "aerial", colored = true, dense = false, dense_sep = ".", depth = 5, sep = " ", sep_icon = "" },
        },
      },
      inactive_winbar = {
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { "filename", path = 0 },
          { "aerial", colored = true, dense = false, dense_sep = ".", depth = 5, sep = " ", sep_icon = "" },
        },
      },
    }
  end,
}
