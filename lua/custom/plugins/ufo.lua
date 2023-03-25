return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true


    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    local language_servers = require("lspconfig").util.available_servers()
    for _, ls in ipairs(language_servers) do
      require("lspconfig")[ls].setup({
        capabilities = capabilities
      })
    end
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end

    -- global handler
    -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
    -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
    require('ufo').setup({
      fold_virt_text_handler = handler
    })

    -- buffer scope handler
    -- will override global handler if it is existed
    -- local bufnr = vim.api.nvim_get_current_buf()
    -- require('ufo').setFoldVirtTextHandler(bufnr, handler)
    require("ufo").setup({
      fold_virt_text_handler = handler

    })
    require("ufo").setup({
      {
        open_fold_hl_timeout = {
          description = [[Time in millisecond between the range to be highlgihted and to be cleared
                    while opening the folded line, `0` value will disable the highlight]],
          default = 400
        },
        provider_selector = {
          description = [[A function as a selector for fold providers. For now, there are
                    'lsp' and 'treesitter' as main provider, 'indent' as fallback provider]],
          default = nil
        },
        close_fold_kinds = {
          description = [[After the buffer is displayed (opened for the first time), close the
                    folds whose range with `kind` field is included in this option. For now,
                    'lsp' provider's standardized kinds are 'comment', 'imports' and 'region',
                    run `UfoInspect` for details if your provider has extended the kinds.]],
          default = {}
        },
        fold_virt_text_handler = {
          description = [[A function customize fold virt text, see ### Customize fold text]],
          default = nil
        },
        enable_get_fold_virt_text = {
          description = [[Enable a function with `lnum` as a parameter to capture the virtual text
                    for the folded lines and export the function to `get_fold_virt_text` field of
                    ctx table as 6th parameter in `fold_virt_text_handler`]],
          default = false
        },
        preview = {
          description = [[Configure the options for preview window and remap the keys for current
                    buffer and preview buffer if the preview window is displayed.
                    Never worry about the users's keymaps are overridden by ufo, ufo will save
                    them and restore them if preview window is closed.]],
          win_config = {
            border = {
              description = [[The border for preview window,
                    `:h nvim_open_win() | call search('border:')`]],
              default = 'rounded',
            },
            winblend = {
              description = [[The winblend for preview window, `:h winblend`]],
              default = 12,
            },
            winhighlight = {
              description = [[The winhighlight for preview window, `:h winhighlight`]],
              default = 'Normal:Normal',
            },
            maxheight = {
              description = [[The max height of preview window]],
              default = 20,
            }
          },
          mappings = {
            description = [[The table for {function = key}]],
            default = [[see ###Preview function table for detail]],
          }
        }
      }
    })
  end
}
