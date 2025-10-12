return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local lualine_require = require("lualine_require")
      lualine_require.require = require
      vim.o.laststatus = vim.g.lualine_laststatus

      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })

      opts.options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          winbar = { "snacks_dashboard", "neo-tree" },
          statusline = { "snacks_dashboard" },
        },
      }

      -- stylua: ignore start
      opts.winbar = {
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { LazyVim.lualine.pretty_path({ length = 0 }) },
        }
      }

      opts.inactive_winbar = opts.winbar

      opts.sections = {
        lualine_a = { { function() return ("%d/%d"):format(vim.fn.tabpagenr(), vim.fn.tabpagenr("$")) end, icon = "󰓩" } },
        lualine_b = { { "branch" } },
        lualine_c = {
          { "filename", path = 0 },
          { symbols and symbols.get, cond = function() return symbols.has() end },
        },
        lualine_x = vim.list_extend(opts.sections.lualine_x, {
          { function() return tostring(vim.api.nvim_get_option_value("shiftwidth", {})) end, icon = "" }
        }),
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = { { "lsp_status" } },
      }
      -- stylua: ignore end

      opts.extensions = { "neo-tree", "lazy", "fzf" }
      return opts
    end,
  },

  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },

  {
    "folke/snacks.nvim",
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
      dashboard = {
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
      },
      indent = {
        indent = {
          only_scope = true,
        },
        chunk = {
          enabled = true,
        },
      },
    },
  },
}
