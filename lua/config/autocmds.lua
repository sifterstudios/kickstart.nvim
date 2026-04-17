-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local color_col = vim.api.nvim_create_augroup("ColorColumn", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufRead" }, {
  group = color_col,
  callback = function()
    vim.opt_local.colorcolumn = "120"
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = color_col,
  callback = function()
    vim.opt_local.colorcolumn = "0"
  end,
})
