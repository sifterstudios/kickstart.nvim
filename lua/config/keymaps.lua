-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>sa", vim.cmd.Ex)

-- Move selected lines up and down in code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Keep cursor in the middle of the screen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Get a list of repos (and create new) tmux session on enter
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Make shell scripts runnable
vim.keymap.set("n", "<leader>!", "<cmd>!chmod +x %<CR>", { silent = true })

-- Toggle twilight
vim.keymap.set("n", "<leader>zt", "<cmd>Twilight<cr>", { silent = true, noremap = true })

-- Toggle ZenMode
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>", { silent = true, noremap = true })
-- Copy whole file
vim.keymap.set("n", "<leader>Y", "ggVGy", { silent = true, noremap = true })

-- Testing of strange bug with Escape/Ctrl key on my keyboard
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
