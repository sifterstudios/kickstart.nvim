return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        {
          priority = 15,
          style = {
            { fg = "#806d9c" },
            { fg = "#c21f30" },
          },
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          textobject = "",
          max_file_size = 1024 * 1024,
          error_sign = true,
          -- animation related
          duration = 2,
          delay = 3,
        },
        {
          style = "#806d9c",
          priority = 10,
          use_treesitter = false,
        },
      })
    end,
  },
}
