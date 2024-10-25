local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    return {
      -- find
      { "<leader>ff", LazyVim.pick("files"), desc = "Files" },
      { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Files (cwd)" },
      { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Files (git-files)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
      { "<leader>fs", "<cmd>Telescope aerial<cr>", desc = "Symbols" },

      -- enhanced builtin tools: grep/command
      { "<leader>/f", LazyVim.pick("live_grep"), desc = "Grep Files" },
      { "<leader>/F", LazyVim.pick("live_grep", { root = false }), desc = "Grep Files (cwd)" },
      { "<leader>/b", "<cmd>Telescope live_grep grep_open_files=true<cr>", desc = "Grep Buffers" },
      { "<leader>//", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer Fuzzy Find" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><leader>", "<cmd>Telescope resume<cr>", desc = "Resume" },

      -- list
      { "<leader>;m", "<cmd>Telescope marks<cr>", desc = "Bookmarks" },
      { "<leader>;r", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>;c", LazyVim.pick("colorscheme"), desc = "Colorscheme" },
    }
  end,

  opts = {
    defaults = vim.tbl_deep_extend("force", require("telescope.themes").get_ivy(), {
      mappings = {
        i = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
        },
        n = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
        },
      },
    }),
    pickers = {
      buffers = {
        mappings = {
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  },
}
