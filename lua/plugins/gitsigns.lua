return {
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
      -- map("n", "]h", function() gs.nav_hunk("last") end, "Last Hunk")
      -- map("n", "[h", function() gs.nav_hunk("first") end, "First Hunk")
      -- stylua: ignore start
      map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>gd", function() gs.diffthis("~") end, "Diff This")
      -- stylua: ignore end
    end,
    preview_config = {
      border = "rounded",
    },
  },
}
