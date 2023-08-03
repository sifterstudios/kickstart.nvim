return {
  "kwkarlwang/bufjump.nvim",
  config = function()
    require("bufjump").setup({
      forward = "<S-BS>",
      backward = "<BS>",
      on_success = nil,
    })
  end,
}
