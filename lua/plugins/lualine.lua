local lspserver = {
  function()
    local msg = "No Active LSP"
    local bufnr = vim.fn.bufnr("%")
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if next(clients) == nil then
      return msg
    end
    if #clients == 1 then
      return clients[1].name
    end
    return clients[1].name .. "(" .. tostring(#clients) .. ")"
  end,
  icon = " :",
}

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- return opts
    vim.o.laststatus = vim.g.lualine_laststatus
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
        lualine_c = { lspserver },
        lualine_x = opts.sections.lualine_x,
        lualine_y = opts.sections.lualine_y,
        lualine_z = opts.sections.lualine_z,
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
