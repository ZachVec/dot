local function toggle_term()
  --- @type snacks.win.Config
  local win = { position = "right", width = 0.5 }
  --- @type snacks.terminal.Opts
  local opts = { cwd = LazyVim.root(), env = { _SNACK_TERM_POS = "right" }, win = win }
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
    "folke/snacks.nvim",
    keys = {
      { "<M-/>", toggle_term, desc = "Terminal on right", mode = { "n", "t" } },
      { "<M-_>", toggle_term, desc = "Terminal on right", mode = { "n", "t" } },
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
}
