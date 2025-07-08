return {
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
          header = [[
 ██╗   ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗
 ██║   ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
 ██║   ██║███████╗    ██║     ██║   ██║██║  ██║█████╗  
 ╚██╗ ██╔╝╚════██║    ██║     ██║   ██║██║  ██║██╔══╝  
  ╚████╔╝ ███████║    ╚██████╗╚██████╔╝██████╔╝███████╗
   ╚═══╝  ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]]
        }
      },
      indent = {
        indent = {
          only_scope = true
        },
        chunk = {
          enabled = true
        },
      }
    },
  },
}
