local function symbols_filter(entry, ctx)
  if ctx.symbols_filter == nil then
    ctx.symbols_filter = LazyVim.config.get_kind_filter(ctx.bufnr) or false
  end
  if ctx.symbols_filter == false then
    return true
  end
  return vim.tbl_contains(ctx.symbols_filter, entry.kind)
end

return {
  {
    "ibhagwan/fzf-lua",
    keys = function()
      -- stylua: ignore
      return {
        { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
        { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
        { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
        { "<leader><space>", "<cmd>FzfLua resume<cr>", desc = "Resume" },

        { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
        { "<leader>ff", LazyVim.pick("files"), desc = "Find Files" },
        { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Git Files" },
        { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
        { "<leader>f<tab>", "<cmd>FzfLua tabs<cr>", desc = "Tabs" },
        { "<leader>fs", function() require("fzf-lua").lsp_document_symbols({ regex_filter = symbols_filter }) end, desc = "Goto Symbol" },
        { "<leader>fS", function() require("fzf-lua").lsp_live_workspace_symbols({ regex_filter = symbols_filter }) end, desc = "Goto Symbol (Workspace)" },

        { '<leader>;"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
        { "<leader>;k", "<cmd>FzfLua keymaps<cr>", desc = "KeyMaps" },
        { "<leader>;c", LazyVim.pick("colorschemes"), desc = "Colorscheme" },
        { "<leader>;m", "<cmd>FzfLua marks<cr>", desc = "Bookmarks" },
        { "<leader>;h", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
        { "<leader>;H", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },

        { "<leader>//", "<cmd>FzfLua grep_curbuf<cr>", desc = "Current Buffer" },
        { "<leader>/b", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>/f", LazyVim.pick("live_grep"), desc = "Grep Files" },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    keys = function()
      return {
        -- stylua: ignore
        { "<leader>ft", function() require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
      }
    end,
  },
}
