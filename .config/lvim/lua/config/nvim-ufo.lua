vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local which_opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

-- map('n', 'm', require('ufo').closeAllFolds, opt)
require('which-key').register({
  o = {
    name = "fold",
    a = {
      i = { function() return require('ufo').closeAllFolds() end, "collapse all" },
      o = { function() return require('ufo').openAllFolds() end, "expand all" }
    },
    i = { "zc", "collapse one block" },
    o = { "zo", "expand one block" },
    k = {function()
          local winid = require('ufo').peekFoldedLinesUnderCursor()
          if not winid then
              -- choose one of coc.nvim and nvim lsp
              vim.lsp.buf.hover()
            end
         end,
        "show preview for fold"
        },
  }
}, which_opts)

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities
--         -- you can add other fields for setting up lsp server in this table
--     })
-- end
-- require('ufo').setup()


-- Tree sitter setup
require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})
vim.keymap.set('n', '`k', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.lsp.buf.hover()
    end
end)

