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
  opts = {
    options = {
      disabled_filetypes = {
        statusline = {
          "neo-tree",
          "aerial",
        },
      },
    },
  },
}
