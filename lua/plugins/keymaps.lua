local function disabled_all_keys()
  return {}
end

--- @type LazyPluginSpec[]
return {

  { "folke/which-key.nvim", keys = disabled_all_keys },
  { "mason-org/mason.nvim", keys = disabled_all_keys },
  { "folke/persistence.nvim", keys = disabled_all_keys },
  { "mfussenegger/nvim-dap-python", keys = disabled_all_keys },

  {
    "gbprod/yanky.nvim",
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>;p", "<cmd>YankyRingHistory<cr>", desc = "Yank History", mode = { "n", "x" } },
      }
    end,
  },

  {
    "MagicDuck/grug-far.nvim",
    -- stylua: ignore
    keys = function()
      local function grug_far()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end
      return {
        { "<leader>/r", grug_far, mode = { "n", "v" }, desc = "Find And Replace" },
      }
    end,
  },

  {
    "folke/snacks.nvim",
    keys = function()
      local function toggle_term()
        local tabid = tostring(vim.api.nvim_get_current_tabpage())
        --- @type table<string, string>
        local env = { _SNACK_TERM_POS = "right", _TAB_ID = tabid }
        --- @type snacks.win.Config
        local win = { position = "right", width = 0.5, relative = "editor" }
        --- @type snacks.terminal.Opts
        local opts = { cwd = LazyVim.root(), env = env, win = win }
        Snacks.terminal.toggle(nil, opts)
      end
    -- stylua: ignore
      return {
        { "<M-/>", toggle_term, desc = "Terminal on right", mode = { "n", "t" }, },
        { "<M-_>", toggle_term, desc = "Terminal on right", mode = { "n", "t" }, },
        { "<leader>;n", function() Snacks.picker.icons() end, desc = "Icons", },
        { "<leader>ef", function() Snacks.explorer({ cwd = LazyVim.root() }) end, desc = "File explorer", },
        { "<leader>n", function () Snacks.notifier.show_history() end, desc = "Notification history", },
      }
    end,
  },

  {
    "ibhagwan/fzf-lua",
    -- stylua: ignore
    keys = function()
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
        { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
        { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits (Repository)" },
        { "<leader>gC", "<cmd>FzfLua git_bcommits<CR>", desc = "Commits (File)" },
        { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
        { "<leader><space>", "<cmd>FzfLua resume<cr>", desc = "Resume" },
        { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
        { "<leader>ff", LazyVim.pick("files"), desc = "Find Files" },
        { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Git Files" },
        { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
        -- { "<leader>fs", function () require("fzf-lua").lsp_document_symbols( { regex_filter = symbols_filter } ) end, desc = "Goto Symbol" },
        { "<leader>fS", function () require("fzf-lua").lsp_live_workspace_symbols({ regex_filter = symbols_filter }) end, desc = "Symbols (Workspace)" },
        { "<leader>f<tab>", "<cmd>FzfLua tabs<cr>", desc = "Tabs" },
        { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Bookmarks" },
        { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
        { "<leader>fH", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
        { '<leader>;"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
        { "<leader>;k", "<cmd>FzfLua keymaps<cr>", desc = "KeyMaps" },
        { "<leader>;c", LazyVim.pick("colorschemes"), desc = "Colorscheme" },
        { "<leader>//", "<cmd>FzfLua grep_curbuf<cr>", desc = "Current Buffer" },
        { "<leader>/b", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>/f", LazyVim.pick("live_grep"), desc = "Grep Files" },
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>ft", function() require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
      }
    end,
  },

  {
    "folke/noice.nvim",
    -- stylua: ignore
    keys = function()
      return {
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = { "i", "n", "s" }, },
        { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = { "i", "n", "s" }, },
      }
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>;v", "<cmd>:VenvSelect<cr>", desc = "Select virtual venv", ft = "python", },
      }
    end,
  },

  {
    "stevearc/aerial.nvim",
    keys = function()
      return {
        { "<leader>es", "<cmd>AerialToggle<cr>", desc = "Symbols Explorer" },
        { "<leader>fs", function () require("aerial").snacks_picker() end, desc = "Symbols (Document)" }
      }
    end,
  },
}
