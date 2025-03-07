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

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { silent = true, noremap = true })

-- Toggle ZenMode
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>", { silent = true, noremap = true })
--
-- Copy whole file
vim.keymap.set("n", "<leader>Y", "ggVGy", { silent = true, noremap = true })

-- Delete Traditional Save command
vim.keymap.del("v", "<C-s>")

-- TODO: Add Harpoon commands
-- TODO: Add Copilot commands
-- TODO: Add show usages command
-- TODO: Add rename file to leader fr
-- TODO: Bookmark commands
-- TODO: Nice to have: move argument left or right in method signature
-- TODO: Zooming of font / terminal, might be a ghostty setting
-- TODO: Get Zen to work again
--
