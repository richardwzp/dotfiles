-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
-- }

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   {
--     command = "prettier",
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
local lsp = require "lvim.lsp.manager";
lsp.setup("eslint", {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
lsp.setup("prettier")

-- vim.list_extend(
--   lvim.lsp.automatic_configuration.skipped_servers,
--   { "typescript" })
lsp.setup("tsserver", {
  autostart = false
})
-- require("typescript-tools").setup {
--   separate_diagnostic_server = false,

-- }
