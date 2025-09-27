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
local dashboard = {
  preset = {
    -- stylua: ignore
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Projects", action = ":lua require('persistence').select()" },
      { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
    header = [[
 ██╗   ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗
 ██║   ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
 ██║   ██║███████╗    ██║     ██║   ██║██║  ██║█████╗  
 ╚██╗ ██╔╝╚════██║    ██║     ██║   ██║██║  ██║██╔══╝  
  ╚████╔╝ ███████║    ╚██████╗╚██████╔╝██████╔╝███████╗
   ╚═══╝  ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]],
  },
}
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local lualine_require = require("lualine_require")
      lualine_require.require = require
      vim.o.laststatus = vim.g.lualine_laststatus

      opts.options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          winbar = { "snacks_dashboard", "neo-tree", "aerial" },
          statusline = { "snacks_dashboard" },
        },
      }

      -- stylua: ignore
      opts.sections.lualine_a = {
        { function() return ("%d/%d"):format(vim.fn.tabpagenr(), vim.fn.tabpagenr("$")) end, icon = "󰓩", },
      }

      -- stylua: ignore
      opts.sections.lualine_b = {
        { "branch" },
      }

      -- stylua: ignore
      opts.sections.lualine_c = {
        { LazyVim.lualine.pretty_path({ length = 0 }) },
      }

      -- stylua: ignore
      table.insert(opts.sections.lualine_x,
        { function() return tostring(vim.api.nvim_get_option_value("shiftwidth", {})) end, icon = "", }
      )

      -- stylua: ignore
      opts.sections.lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      }

      -- stylua: ignore
      opts.sections.lualine_z = {
        { "lsp_status" },
      }

      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })

      opts.winbar = {
        -- stylua: ignore
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { "filename", path = 0 },
          { symbols and symbols.get, cond = function () return symbols.has() end }
        },
      }

      opts.inactive_winbar = opts.winbar

      opts.extensions = { "neo-tree", "lazy", "fzf" }
      return opts
    end,
  },
  {
    "folke/noice.nvim",
    keys = function()
      -- stylua: ignore
      return {
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = { "i", "n", "s" } },
        { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = { "i", "n", "s" } },
      }
    end,
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    {
      "folke/snacks.nvim",
      keys = {
        {
          "<M-/>",
          toggle_term,
          desc = "Terminal on right",
          mode = { "n", "t" },
        },
        {
          "<M-_>",
          toggle_term,
          desc = "Terminal on right",
          mode = { "n", "t" },
        },
      },
      opts = {
        dim = {
          scope = {
            min_size = 10,
          },
        },
        terminal = {
          win = {
            position = "float",
            border = "rounded",
          },
        },
        dashboard = dashboard,
        indent = {
          indent = {
            only_scope = true,
          },
          chunk = {
            enabled = true,
          },
        },
        -- profiler = {},
      },
      -- keys = {
      --   { "<leader>ps", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Bufer" },
      -- },
    },
  },
}
