-- General keys: https://www.lazyvim.org/configuration/general#keymaps
--[[ ASCII ART (ANSI Shadow): https://patorjk.com/software/taag
██████╗ ██╗███████╗ █████╗ ██████╗ ██╗     ███████╗
██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██║     ██╔════╝
██║  ██║██║███████╗███████║██████╔╝██║     █████╗
██║  ██║██║╚════██║██╔══██║██╔══██╗██║     ██╔══╝
██████╔╝██║███████║██║  ██║██████╔╝███████╗███████╗
╚═════╝ ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝
--]]
-- buffers
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>bd")
vim.keymap.del("n", "<leader>bD")

-- Lazy
vim.keymap.del("n", "<leader>l")

-- New file
vim.keymap.del("n", "<leader>fn")

vim.keymap.del("n", "[q")
vim.keymap.del("n", "]q")

-- Diagnosis
vim.keymap.del("n", "<leader>cd")

-- LazyGit
vim.keymap.del("n", "<leader>gb")
vim.keymap.del("n", "<leader>gB")
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gf")
vim.keymap.del("n", "<leader>gl")
vim.keymap.del("n", "<leader>gL")

-- quit
vim.keymap.del("n", "<leader>qq")

-- highlights under cursor (AST)
vim.keymap.del("n", "<leader>ui")
vim.keymap.del("n", "<leader>uI")

-- LazyVim ChangeLog
vim.keymap.del("n", "<leader>L")

-- terminal
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
-- vim.keymap.del("n", "<c-/>")

-- terminal mappings
vim.keymap.del("t", "<C-h>")
vim.keymap.del("t", "<C-j>")
vim.keymap.del("t", "<C-k>")
vim.keymap.del("t", "<C-l>")
-- vim.keymap.del("t", "<c-/>")

-- windows
vim.keymap.del("n", "<leader>w")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")
vim.keymap.del({"n", "i", "v"}, "<A-j>")
vim.keymap.del({"n", "i", "v"}, "<A-k>")

-- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>]")

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
vim.keymap.set("n", "<leader>gt", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit" })

vim.keymap.set("n", "<A-k>", "<cmd>resize +1<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<A-j>", "<cmd>resize -1<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
