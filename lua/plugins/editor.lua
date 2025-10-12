--- @type LazyPluginSpec[]
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = {
          preset = "ivy",
        },
        sources = {
          --- @type snacks.picker.explorer.Config
          explorer = {
            -- layout = { preset = "ivy", preview = true },
            win = {
              input = {
                keys = {
                  ["/"] = false,
                  ["<C-Down>"] = false,
                  ["<C-Up>"] = false,
                  ["<C-c>"] = false,
                  ["<C-w>"] = false,
                  -- ["<CR>"] = { "confirm", mode = { "n", "i" } },
                  ["<Down>"] = false,
                  ["<Esc>"] = "focus_list",
                  ["<S-CR>"] = false,
                  ["<S-Tab>"] = false,
                  -- ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
                  ["<Up>"] = false,
                  ["<a-d>"] = false,
                  ["<a-f>"] = false,
                  ["<a-h>"] = false,
                  ["<a-i>"] = false,
                  ["<a-m>"] = false,
                  ["<a-p>"] = false,
                  ["<a-w>"] = false,
                  ["<c-a>"] = false,
                  -- ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
                  -- ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
                  -- ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
                  -- ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
                  ["<c-g>"] = false,
                  -- ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                  -- ["<c-k>"] = { "list_up", mode = { "i", "n" } },
                  ["<c-n>"] = false,
                  ["<c-p>"] = false,
                  ["<c-q>"] = false,
                  -- ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
                  -- ["<c-t>"] = { "tab", mode = { "n", "i" } },
                  -- ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
                  ["<c-r>#"] = false,
                  ["<c-r>%"] = false,
                  ["<c-r><c-a>"] = false,
                  ["<c-r><c-f>"] = false,
                  ["<c-r><c-l>"] = false,
                  ["<c-r><c-p>"] = false,
                  ["<c-r><c-w>"] = false,
                  ["<c-w>H"] = false,
                  ["<c-w>J"] = false,
                  ["<c-w>K"] = false,
                  ["<c-w>L"] = false,
                  -- ["?"] = "toggle_help_input",
                  -- ["G"] = "list_bottom",
                  -- ["gg"] = "list_top",
                  -- ["j"] = "list_down",
                  -- ["k"] = "list_up",
                  -- ["q"] = "close",
                },
              },
              list = {
                keys = {
                  -- ["/"] = "toggle_focus",
                  -- ["<2-LeftMouse>"] = "confirm",
                  -- ["<CR>"] = "confirm",
                  ["<Down>"] = false,
                  ["<Esc>"] = false,
                  ["<S-CR>"] = false,
                  ["<S-Tab>"] = false,
                  -- ["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
                  ["<Up>"] = false,
                  ["<a-d>"] = false,
                  -- ["<a-f>"] = "toggle_follow",
                  ["<a-h>"] = false,
                  ["<a-i>"] = false,
                  -- ["<a-m>"] = "toggle_maximize",
                  ["<a-p>"] = false,
                  ["<a-w>"] = false,
                  -- ["<c-a>"] = "select_all",
                  -- ["<c-b>"] = "preview_scroll_up",
                  -- ["<c-f>"] = "preview_scroll_down",
                  -- ["<c-d>"] = "list_scroll_down",
                  -- ["<c-u>"] = "list_scroll_up",
                  ["<c-j>"] = false,
                  ["<c-k>"] = false,
                  ["<c-n>"] = false,
                  ["<c-p>"] = false,
                  ["<c-q>"] = false,
                  -- ["<c-s>"] = "edit_split",
                  -- ["<c-t>"] = "tab",
                  -- ["<c-v>"] = "edit_vsplit",
                  ["<c-w>H"] = false,
                  ["<c-w>J"] = false,
                  ["<c-w>K"] = false,
                  ["<c-w>L"] = false,
                  -- ["?"] = "toggle_help_list",
                  -- ["G"] = "list_bottom",
                  -- ["gg"] = "list_top",
                  ["i"] = "inspect",
                  -- ["j"] = "list_down",
                  -- ["k"] = "list_up",
                  -- ["q"] = "close",
                  ["zb"] = false,
                  ["zt"] = false,
                  ["zz"] = false,
                  -- explorer specific keymaps
                  -- ["<BS>"] = "explorer_up",
                  ["l"] = false,
                  ["h"] = false,
                  -- ["a"] = "explorer_add",
                  -- ["d"] = "explorer_del",
                  -- ["r"] = "explorer_rename",
                  -- ["c"] = "explorer_copy",
                  -- ["m"] = "explorer_move",
                  ["o"] = false,
                  -- ["P"] = "toggle_preview",
                  -- ["y"] = { "explorer_yank", mode = { "n", "x" } },
                  -- ["p"] = "explorer_paste",
                  -- ["u"] = "explorer_update",
                  ["<c-c>"] = false,
                  ["<leader>/"] = false,
                  ["<c-t>"] = false,
                  -- ["."] = "explorer_focus",
                  -- ["I"] = "toggle_ignored",
                  -- ["H"] = "toggle_hidden",
                  -- ["Z"] = "explorer_close_all",
                  ["]g"] = "explorer_git_next",
                  ["[g"] = "explorer_git_prev",
                  ["]d"] = "explorer_diagnostic_next",
                  ["[d"] = "explorer_diagnostic_prev",
                  ["]w"] = "explorer_warn_next",
                  ["[w"] = "explorer_warn_prev",
                  ["]e"] = "explorer_error_next",
                  ["[e"] = "explorer_error_prev",

                  -- added
                  ["w"] = { { "pick_win", "jump" } },
                },
              },
            },
          },
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk")
        map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, "Blame Line")
        map("n", "<leader>gd", function()
          gs.diffthis("~")
        end, "Diff This")
      end,
      preview_config = {
        border = "rounded",
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = {
        -- stylua: ignore
        {
          mode = { "n", "v" },
          { "<leader>c", group = "code" },
          { "<leader>d", group = "debug", icon = { icon = " ", color = "red" } },
          { "<leader>da", icon = { icon = " ", color = "green" } },
          { "<leader>db", icon = { icon = " ", color = "red" } },
          { "<leader>dB", icon = { icon = " ", color = "azure" } },
          { "<leader>dc", icon = { icon = " ", color = "green" } },
          { "<leader>dC", icon = { icon = " ", color = "green" } },
          { "<leader>di", icon = { icon = "󰆹 ", color = "green" } },
          { "<leader>do", icon = { icon = "󰆸 ", color = "green" } },
          { "<leader>dO", icon = { icon = " ", color = "green" } },
          { "<leader>dP", icon = { icon = " ", color = "green" } },
          { "<leader>dt", icon = { icon = " ", color = "green" } },
          -- { "<leader>de", hidden = true },
          -- { "<leader>dg", hidden = true },
          -- { "<leader>dl", hidden = true },
          -- { "<leader>dw", hidden = true },
          -- { "<leader>dp", hidden = true },
          { "<leader>f", group = "find" },
          { "<leader>g", group = "git" },
          { "<leader>/", group = "grep", icon = " " },
          { "<leader>;", group = "list", icon = " " },
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          { "<leader>e", group = "explorer", icon = { icon = "󰖟 ", color = "cyan" } },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
        },
      }
    end,
  },

  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        width = 0.2,
        default_direction = "left",
      },
    },
  },
}
