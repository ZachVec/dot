local function symbols_filter(entry, ctx)
  if ctx.symbols_filter == nil then
    ctx.symbols_filter = LazyVim.config.get_kind_filter(ctx.bufnr) or false
  end
  if ctx.symbols_filter == false then
    return true
  end
  return vim.tbl_contains(ctx.symbols_filter, entry.kind)
end

--- @type LazyPluginSpec[]
return {

  {
    "MagicDuck/grug-far.nvim",
    keys = function()
      local function grugfar()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = { filesFilter = ext and ext ~= "" and "*." .. ext or nil },
        })
      end
      -- stylua: ignore
      return {
        { "<leader>/r", grugfar, mode = { "n", "v" }, desc = "Search and Replace" },
      }
    end,
  },

  {
    "folke/snacks.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>ef", function() Snacks.explorer({ cwd = LazyVim.root() }) end, },
    },
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
    "ibhagwan/fzf-lua",
    keys = function()
      -- stylua: ignore
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
        { "<leader>fs", function() require("fzf-lua").lsp_document_symbols({ regex_filter = symbols_filter, }) end, desc = "Goto Symbol" },
        { "<leader>fS", function() require("fzf-lua").lsp_live_workspace_symbols({ regex_filter = symbols_filter, }) end, desc = "Goto Symbol (Workspace)" },
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
    keys = function()
      -- stylua: ignore
      return {
        { "<leader>ft", function() require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" }, }) end, desc = "Todo/Fix/Fixme" },
      }
    end,
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
    keys = {
      { "<leader>?", false },
    },
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
    keys = {
      { "<leader>cs", false },
    },
  },
}
