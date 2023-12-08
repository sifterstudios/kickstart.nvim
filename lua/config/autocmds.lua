-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_exec(
  [[
  augroup ColorColumn
    autocmd!
    autocmd WinEnter,BufRead * set colorcolumn=120
    autocmd WinLeave * set colorcolumn=0
  augroup END
]],
  false
)
