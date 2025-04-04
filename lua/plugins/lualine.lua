local function get_shiftwidth()
  return tostring(vim.api.nvim_get_option_value("shiftwidth", {}))
end

local function set_shiftwidth()
  local options = { "2", "4", "8" }
  vim.ui.select(options, {
    prompt = "Select Indentation:",
    format_item = function(item)
      return "Spaces: " .. item
    end,
  }, function(choice)
    if choice then
      vim.api.nvim_set_option_value("shiftwidth", tonumber(choice), {})
      vim.api.nvim_set_option_value("tabstop", tonumber(choice), {})
      vim.api.nvim_set_option_value("expandtab", true, {})
      vim.api.nvim_set_option_value("softtabstop", tonumber(choice), {})
    end
  end)
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- return opts
    vim.o.laststatus = vim.g.lualine_laststatus
    table.insert(opts.sections.lualine_x, {
      get_shiftwidth,
      icon = " :",
      on_click = set_shiftwidth,
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
        lualine_a = { "tabs" },
        lualine_b = opts.sections.lualine_b,
        lualine_c = {},
        lualine_x = opts.sections.lualine_x,
        lualine_y = opts.sections.lualine_y,
        lualine_z = { "lsp_status" },
      },
      winbar = {
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { LazyVim.lualine.pretty_path() },
          { "aerial", colored = true, dense = false, dense_sep = ".", depth = 5, sep = " ", sep_icon = "" },
        },
      },
      inactive_winbar = {
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { LazyVim.lualine.pretty_path() },
          { "aerial", colored = true, dense = false, dense_sep = ".", depth = 5, sep = " ", sep_icon = "" },
        },
      },
    }
  end,
}
