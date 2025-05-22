-- General keys: https://www.lazyvim.org/configuration/general#keymaps
--[[ ASCII ART (ANSI Shadow): https://patorjk.com/software/taag
██████╗ ██╗███████╗ █████╗ ██████╗ ██╗     ███████╗
██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██║     ██╔════╝
██║  ██║██║███████╗███████║██████╔╝██║     █████╗
██║  ██║██║╚════██║██╔══██║██╔══██╗██║     ██╔══╝
██████╔╝██║███████║██║  ██║██████╔╝███████╗███████╗
╚═════╝ ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝
--]]

-- pcall(vim.keymap.del, {"n", "x"}, "j") --Down
-- pcall(vim.keymap.del, {"n", "x"}, "<Down>") --Down
-- pcall(vim.keymap.del, {"n", "x"}, "k") --Up
-- pcall(vim.keymap.del, {"n", "x"}, "<Up>") --Up
-- pcall(vim.keymap.del, {"n"}, "<C-h>") --Go to Left Window
-- pcall(vim.keymap.del, {"n"}, "<C-j>") --Go to Lower Window
-- pcall(vim.keymap.del, {"n"}, "<C-k>") --Go to Upper Window
-- pcall(vim.keymap.del, {"n"}, "<C-l>") --Go to Right Window
pcall(vim.keymap.del, { "n" }, "<C-Up>") --Increase Window Height
pcall(vim.keymap.del, { "n" }, "<C-Down>") --Decrease Window Height
pcall(vim.keymap.del, { "n" }, "<C-Left>") --Decrease Window Width
pcall(vim.keymap.del, { "n" }, "<C-Right>") --Increase Window Width
pcall(vim.keymap.del, { "n", "i", "v" }, "<A-j>") --Move Down
pcall(vim.keymap.del, { "n", "i", "v" }, "<A-k>") --Move Up
pcall(vim.keymap.del, { "n" }, "<S-h>") --Prev Buffer
pcall(vim.keymap.del, { "n" }, "<S-l>") --Next Buffer
pcall(vim.keymap.del, { "n" }, "[b") --Prev Buffer
pcall(vim.keymap.del, { "n" }, "]b") --Next Buffer
pcall(vim.keymap.del, { "n" }, "<leader>bb") --Switch to Other Buffer
pcall(vim.keymap.del, { "n" }, "<leader>`") --Switch to Other Buffer
pcall(vim.keymap.del, { "n" }, "<leader>bd") --Delete Buffer
pcall(vim.keymap.del, { "n" }, "<leader>bo") --Delete Other Buffers
pcall(vim.keymap.del, { "n" }, "<leader>bD") --Delete Buffer and Window
-- pcall(vim.keymap.del, {"i", "n", "s"}, "<esc>") --Escape and Clear hlsearch
-- pcall(vim.keymap.del, {"n"}, "<leader>ur") --Redraw / Clear hlsearch / Diff Update
-- pcall(vim.keymap.del, {"n", "x", "o"}, "n") --Next Search Result
-- pcall(vim.keymap.del, {"n", "x", "o"}, "N") --Prev Search Result
pcall(vim.keymap.del, { "i", "x", "n", "s" }, "<C-s>") --Save File
pcall(vim.keymap.del, { "n" }, "<leader>K") --Keywordprg
pcall(vim.keymap.del, { "n" }, "gco") --Add Comment Below
pcall(vim.keymap.del, { "n" }, "gcO") --Add Comment Above
pcall(vim.keymap.del, { "n" }, "<leader>l") --Lazy
pcall(vim.keymap.del, { "n" }, "<leader>fn") --New File
pcall(vim.keymap.del, { "n" }, "<leader>xl") --Location List
pcall(vim.keymap.del, { "n" }, "<leader>xq") --Quickfix List
pcall(vim.keymap.del, { "n" }, "[q") --Previous Quickfix
pcall(vim.keymap.del, { "n" }, "]q") --Next Quickfix
-- pcall(vim.keymap.del, {"n", "v"}, "<leader>cf") --Format
pcall(vim.keymap.del, { "n" }, "<leader>cd") --Line Diagnostics
-- pcall(vim.keymap.del, {"n"}, "]d") --Next Diagnostic
-- pcall(vim.keymap.del, {"n"}, "[d") --Prev Diagnostic
-- pcall(vim.keymap.del, {"n"}, "]e") --Next Error
-- pcall(vim.keymap.del, {"n"}, "[e") --Prev Error
-- pcall(vim.keymap.del, {"n"}, "]w") --Next Warning
-- pcall(vim.keymap.del, {"n"}, "[w") --Prev Warning
-- pcall(vim.keymap.del, {"n"}, "<leader>uf") --Toggle Auto Format (Global)
-- pcall(vim.keymap.del, {"n"}, "<leader>uF") --Toggle Auto Format (Buffer)
-- pcall(vim.keymap.del, {"n"}, "<leader>us") --Toggle Spelling
-- pcall(vim.keymap.del, {"n"}, "<leader>uw") --Toggle Wrap
-- pcall(vim.keymap.del, {"n"}, "<leader>uL") --Toggle Relative Number
-- pcall(vim.keymap.del, {"n"}, "<leader>ud") --Toggle Diagnostics
-- pcall(vim.keymap.del, {"n"}, "<leader>ul") --Toggle Line Numbers
-- pcall(vim.keymap.del, {"n"}, "<leader>uc") --Toggle Conceal Level
-- pcall(vim.keymap.del, {"n"}, "<leader>uA") --Toggle Tabline
-- pcall(vim.keymap.del, {"n"}, "<leader>uT") --Toggle Treesitter Highlight
-- pcall(vim.keymap.del, {"n"}, "<leader>ub") --Toggle Dark Background
-- pcall(vim.keymap.del, {"n"}, "<leader>uD") --Toggle Dimming
-- pcall(vim.keymap.del, {"n"}, "<leader>ua") --Toggle Animations
-- pcall(vim.keymap.del, {"n"}, "<leader>ug") --Toggle Indent Guides
-- pcall(vim.keymap.del, {"n"}, "<leader>uS") --Toggle Smooth Scroll
pcall(vim.keymap.del, { "n" }, "<leader>dpp") --Toggle Profiler
pcall(vim.keymap.del, { "n" }, "<leader>dph") --Toggle Profiler Highlights
-- pcall(vim.keymap.del, {"n"}, "<leader>uh") --Toggle Inlay Hints
-- pcall(vim.keymap.del, {"n"}, "<leader>gb") --Git Blame Line
pcall(vim.keymap.del, { "n", "x" }, "<leader>gB") --Git Browse (open)

pcall(vim.keymap.del, { "n", "x" }, "<leader>gB") --Git Browse (open)
pcall(vim.keymap.del, { "n", "x" }, "<leader>gY") --Git Browse (copy)
pcall(vim.keymap.del, { "n" }, "<leader>qq") --Quit All
pcall(vim.keymap.del, { "n" }, "<leader>ui") --Inspect Pos
pcall(vim.keymap.del, { "n" }, "<leader>uI") --Inspect Tree
pcall(vim.keymap.del, { "n" }, "<leader>L") --LazyVim Changelog
pcall(vim.keymap.del, { "n" }, "<leader>fT") --Terminal (cwd)
pcall(vim.keymap.del, { "n" }, "<leader>ft") --Terminal (Root Dir)
-- pcall(vim.keymap.del, {"n"}, "<c-/>") --Terminal (Root Dir)
-- pcall(vim.keymap.del, { "n", "t" }, "<c-_>") --which_key_ignore
-- pcall(vim.keymap.del, {"t"}, "<C-/>") --Hide Terminal
pcall(vim.keymap.del, { "n" }, "<leader>-") --Split Window Below
pcall(vim.keymap.del, { "n" }, "<leader>|") --Split Window Right
pcall(vim.keymap.del, { "n" }, "<leader>wd") --Delete Window
pcall(vim.keymap.del, { "n" }, "<leader>wm") --Toggle Zoom Mode
pcall(vim.keymap.del, { "n" }, "<leader>uZ") --Toggle Zoom Mode
-- pcall(vim.keymap.del, {"n"}, "<leader>uz") --Toggle Zen Mode
pcall(vim.keymap.del, { "n" }, "<leader><tab>l") --Last Tab
pcall(vim.keymap.del, {"n"}, "<leader><tab>o") --Close Other Tabs
pcall(vim.keymap.del, { "n" }, "<leader><tab>f") --First Tab
pcall(vim.keymap.del, { "n" }, "<leader><tab><tab>") --New Tab
pcall(vim.keymap.del, { "n" }, "<leader><tab>]") --Next Tab
pcall(vim.keymap.del, { "n" }, "<leader><tab>d") --Close Tab
pcall(vim.keymap.del, { "n" }, "<leader><tab>[") --Previous Tab
pcall(vim.keymap.del, { "s" }, "<Tab>") --Jump Next
pcall(vim.keymap.del, { "i", "s" }, "<S-Tab>") --Jump Previous

--[[ ASCII ART (ANSI Shadow): https://patorjk.com/software/taag
███╗   ███╗ █████╗ ██████╗
████╗ ████║██╔══██╗██╔══██╗
██╔████╔██║███████║██████╔╝
██║╚██╔╝██║██╔══██║██╔═══╝
██║ ╚═╝ ██║██║  ██║██║
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
--]]
vim.keymap.set("n", "gH", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "gL", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "gh", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "gl", "<cmd>tabnext<cr>", { desc = "Next Tab" })

-- Lazygit
if vim.fn.executable("lazygit") == 1 then
  -- lazygit terminal
  pcall(vim.keymap.del, "n", "<leader>gg")
  vim.keymap.set("n", "<leader>gt", function()
    Snacks.lazygit({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit" })

  -- lazygit terminal cwd
  pcall(vim.keymap.del, "n", "<leader>gG")
  -- vim.keymap.set("n", "<leader>gT", function()
  --   Snacks.lazygit()
  -- end, { desc = "Lazygit (cwd)" })

  -- git file history
  pcall(vim.keymap.del, "n", "<leader>gf")
  vim.keymap.set("n", "<leader>gh", function()
    Snacks.picker.git_log_file()
  end, { desc = "Git File History" })
  -- pcall(vim.keymap.del, "n", "<leader>gl")
  pcall(vim.keymap.del, "n", "<leader>gL")
end

vim.keymap.set("n", "<A-k>", "<cmd>resize +1<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<A-j>", "<cmd>resize -1<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<leader>;i", function()
  local options = { "2", "4", "8" }
  vim.ui.select(options, {
    prompt = "Select Indentation:",
    format_item = function(item)
      return "Spaces: " .. item
    end,
  }, function(choice)
    -- /boot/
    if choice then
      vim.api.nvim_set_option_value("shiftwidth", tonumber(choice), {})
      vim.api.nvim_set_option_value("tabstop", tonumber(choice), {})
      vim.api.nvim_set_option_value("expandtab", true, {})
      vim.api.nvim_set_option_value("softtabstop", tonumber(choice), {})
    end
  end)
end, { desc = "Indentation" })
