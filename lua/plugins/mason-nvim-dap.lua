return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = "mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    automatic_installation = true,
    ensure_installed = {},

    -- :h mason-nvim-dap for more
    handlers = {
      require("mason-nvim-dap").default_setup,
      python = function(config)
        config.adapters = {
          type = "executable",
          command = "/usr/bin/env",
          args = { "python3", "-m", "debugpy.adapter" },
        }
        require("mason-nvim-dap").default_setup(config)
      end,
      cpp = function(config)
        config.adapters = {
          id = "cppdbg",
          type = "executable",
          command = vim.fn.exepath("OpenDebugAD7"),
          detached = vim.fn.has("win32") and nil or false,
        }
      end,
    },
  },
  config = function() end,
}
