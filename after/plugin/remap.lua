vim.keymap.set("n", "<leader>sa", vim.cmd.Ex)

-- Toggle TO-DO quickfix-window
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<CR>")
-- Move selected lines up and down in code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle of the screen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Go to next/previous error line
vim.keymap.set("n", "<leader>o", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>O", "<cmd>lprev<CR>zz")

-- -- RADICAL: Remap [] to < > !!!
vim.keymap.set({ "v", "o", "x" }, "<leader>,", "[")
vim.keymap.set({ "v", "o", "x" }, "<leader>.", "[")
vim.cmd([[
nmap . ]
nmap . ]
omap . ]
omap , [
xmap , [
xmap , [
]])

-- Paste from clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard: asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Toggle twilight
vim.keymap.set("n", "<leader>tt", "<cmd>Twilight<cr>",
	{ silent = true, noremap = true })

-- Toggle ZenMode
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>",
	{ silent = true, noremap = true })

-- Delete from cursor positon, combine with _ or $, for example
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Get a list of repos (and create new) tmux session on enter
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format document
vim.keymap.set("n", "<leader>f", "<cmd>Format<CR>")

-- Search for word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make shell scripts runnable
vim.keymap.set("n", "<leader>!", "<cmd>!chmod +x %<CR>", { silent = true })

-- Toggle UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Remap semicolon to colon in normal mode so you don't need shift for commands
vim.keymap.set("n", ";", [[:]])

-- Add semicolon if by the off chance I will need it in normal mode
vim.keymap.set("n", "<leader>;", [[;]])
