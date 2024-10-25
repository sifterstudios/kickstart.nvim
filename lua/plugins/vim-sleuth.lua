return {
  "tpope/vim-sleuth",
  config = function()
    if not vim.g._has_set_default_indent_settings then
      -- Set the indenting level to 2 spaces for the following file types.
      vim.api.nvim_exec2(
        [[
        autocmd FileType typescript,javascript,jsx,tsx,css,html,ruby,elixir,kotlin,vim,plantuml,java,go
                  \ setlocal expandtab tabstop=4 shiftwidth=4
        set expandtab
        set tabstop=4
        set shiftwidth=4
        let g:_has_set_default_indent_settings = 1
      ]],
        { false }
      )
    end
  end,
}
