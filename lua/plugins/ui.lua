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
          -- stylua: ignore
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { "filename", path = 0 },
          { "aerial", colored = true, dense = false, dense_sep = ".", depth = 5, sep = " ", sep_icon = "" },
        },
        },
        inactive_winbar = {
          -- stylua: ignore
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
          { "filename", path = 0 },
          { "aerial", colored = true, dense = false, dense_sep = ".", depth = 5, sep = " ", sep_icon = "" },
        },
        },
      }
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
