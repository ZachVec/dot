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
  init = function()
    vim.opt.showtabline = 0
  end,
  opts = function(_, opts)
    table.insert(opts.options.disabled_filetypes, "dashboard")
    table.insert(opts.options.disabled_filetypes, "neo-tree")
    table.insert(opts.options.disabled_filetypes, "aerial")
    opts.winbar = {
      lualine_b = opts.sections.lualine_c,
    }
    opts.inactive_winbar = opts.winbar
    opts.sections.lualine_a = { "tabs" }
    opts.sections.lualine_b = { "branch", "diff" }
    opts.sections.lualine_c = {}
    opts.sections.lualine_z = { lspserver }
  end,
}
