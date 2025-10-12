--- @type LazyPluginSpec[]
return {

  {
    "folke/snacks.nvim",
    -- stylua: ignore
    opts = {
      picker = {
        layout = {
          preset = "ivy",
        },
        sources = {
          --- @type snacks.picker.explorer.Config
          explorer = {
            focus = "input",
            layout = { preset = "ivy", preview = true },
            actions = {
              toggle_dir = function(picker, item)
                if item.dir then
                  picker:action("confirm")
                end
              end,
              custom_confirm = function(picker, item)
                local filtered = picker:filter().pattern:len() > 0

                if not filtered then
                  if item.dir then
                    picker:action("confirm")
                  else
                    picker:action({ "confirm", "close" })
                  end
                  return
                end

                if item.dir then
                  return
                end

                picker:action("confirm")
                vim.defer_fn(function()
                  picker:action({ "confirm", "close" })
                end, 0)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<C-C>"] = false,
                  ["<C-W>"] = false,
                  ["<C-N>"] = false,
                  ["<C-P>"] = false,
                  ["<C-Q>"] = false,
                  ["<C-G>"] = false,
                  ["<C-A>"] = false,
                  ["<C-UP>"] = false,
                  ["<C-DOWN>"] = false,
                  ["<C-R>#"] = false,
                  ["<C-R>%"] = false,
                  ["<C-R><C-A>"] = false,
                  ["<C-R><C-W>"] = false,
                  ["<C-R><C-F>"] = false,
                  ["<C-R><C-P>"] = false,
                  ["<C-R><C-L>"] = false,
                  ["<C-W>H"] = false,
                  ["<C-W>J"] = false,
                  ["<C-W>K"] = false,
                  ["<C-W>L"] = false,
                  ["<M-d>"] = false,
                  ["<M-h>"] = false,
                  ["<M-i>"] = false,
                  ["<M-w>"] = false,
                  ["<M-f>"] = false,
                  ["<M-m>"] = false,
                  ["<M-p>"] = false,
                  ["<S-CR>"] = false,
                  ["<UP>"] = false,
                  ["<DOWN>"] = false,
                  ["H"] = "toggle_hidden",
                  ["I"] = "toggle_ignored",
                  ["F"] = "toggle_follow",
                  ["M"] = "toggle_maximize",
                  ["P"] = "toggle_preview",
                  ["w"] = { { "pick_win", "jump", "close" }, desc = "window" },
                  ["e"] = "toggle_dir",
                  [">"] = "explorer_focus",
                  ["<"] = "explorer_up",
                  ["u"] = "explorer_update",
                  ["r"] = "explorer_rename",
                  ["a"] = "explorer_add",
                  ["d"] = { "explorer_del", mode = "n" },
                  ["y"] = { "explorer_yank", mode = { "n", "x" } },
                  ["p"] = "explorer_paste",
                  ["<CR>"] = { "custom_confirm", mode = { "i", "n" } },
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
      },
    },
  },
}
