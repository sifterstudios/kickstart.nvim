-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>sa", vim.cmd.Ex)

-- Move selected lines up and down in code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle of the screen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- copy to clipboard: asbjornHaland
--vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Get a list of repos (and create new) tmux session on enter
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Make shell scripts runnable
vim.keymap.set("n", "<leader>!", "<cmd>!chmod +x %<CR>", { silent = true })

-- Set backspace and shift-backspace to ctrl-o and ctrl-i
vim.keymap.set("n", "<BS>", "<C-o>")
vim.keymap.set("n", "<S-BS>", "<C-i>")
