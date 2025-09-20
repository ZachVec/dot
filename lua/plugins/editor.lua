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
    "nvim-neo-tree/neo-tree.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>ef", function() require("neo-tree.command").execute({ source = "filesystem", toggle = true, dir = LazyVim.root() }) end, desc = "Explorer NeoTree (Root Dir)" },
      { "<leader>eg", function() require("neo-tree.command").execute({ source = "git_status", toggle = true, }) end, desc = "Git Explorer", },
      { "<leader>eb", function() require("neo-tree.command").execute({ source = "buffers", toggle = true, }) end, desc = "Buffer Explorer", },
      { "<leader>es", function() require("neo-tree.command").execute({ source = "document_symbols", toggle = true, }) end, desc = "Symbol Explorer", },
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>be", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>gE", false },
    },
    opts = function(_, opts)
      table.insert(opts.sources, "document_symbols")
      opts = vim.tbl_deep_extend("force", opts, {
        window = {
          mappings = {
            ["."] = "noop",
            ["b"] = "noop",
            ["f"] = "noop",
            ["h"] = "noop",
            ["i"] = "noop",
            ["l"] = "noop",
            ["o"] = "noop",
            ["z"] = "noop",
            ["O"] = "noop",
            ["C"] = "noop",
            ["oc"] = "noop",
            ["od"] = "noop",
            ["og"] = "noop",
            ["om"] = "noop",
            ["on"] = "noop",
            ["os"] = "noop",
            ["ot"] = "noop",
            ["<bs>"] = "noop",
            ["e"] = "toggle_node",
            ["="] = "toggle_auto_expand_width",
            ["zC"] = "close_all_nodes",
            ["zc"] = "close_node",
            ["zR"] = "expand_all_nodes",
            ["zo"] = "expand_all_subnodes",
          },
        },
        filesystem = {
          window = {
            mappings = {
              ["#"] = "noop",
              ["A"] = "noop",
              ["D"] = "noop",
              ["]g"] = "noop",
              ["[g"] = "noop",
              ["<C-x>"] = "noop",
            },
          },
        },
        buffers = {
          window = {
            mappings = {
              ["bd"] = "noop",
            },
          },
        },
        git_status = {
          window = {
            -- stylua: ignore
            mappings = {
              ["c"] = "noop",
              ["d"] = "noop",
              ["m"] = "noop",
              ["p"] = "noop",
              ["s"] = "noop",
              ["t"] = "noop",
              ["w"] = "noop",
              ["x"] = "noop",
              ["y"] = "noop",
              ["S"] = "noop",
              ["ga"] = "noop", -- stage
              ["gc"] = "noop", -- commit
              ["gg"] = "noop", -- commit and push
              ["gp"] = "noop", -- push
              ["gr"] = "noop", -- revert
              ["gu"] = "noop", -- unstage
              ["gU"] = "noop", -- Undo last commit
              ["a"] = { function(state) local gcmd = require("neo-tree.sources.git_status.commands") gcmd.git_add_all(state) end, desc = "git add file" },
              ["r"] = { function(state) local gcmd = require("neo-tree.sources.git_status.commands") gcmd.git_revert_file(state) end, desc = "git restore file" },
              ["u"] = { function(state) local gcmd = require("neo-tree.sources.git_status.commands") gcmd.git_unstage_file(state) end, desc = "git unstage file" },
            },
          },
        },
        default_component_configs = {
          indent = {
            indent_size = 1,
          },
        },
        source_selector = {
          sources = {
            { source = "filesystem" },
            { source = "document_symbols" },
          },
          winbar = true,
          statusline = false,
        },
      })
      return opts
    end,
  },

  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
    },
    opts = {
      hint = "floating-big-letter",
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify", "snacks_notif" },
          buftype = { "terminal", "quickfix" },
        },
      },
      show_prompt = false,
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
