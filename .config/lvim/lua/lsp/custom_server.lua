local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

local custom_attach = function(client) print("Racket LSP started."); end

local opts = {
  cmd = { "racket", "--lib", "racket-langserver" },
  filetypes = { "scheme", "racket" },
  root_dir = require("lspconfig").util.find_git_ancestor,
  single_file_support = true,
  auto_start = true,
}
--[[ if not lspconfig.racket then
  configs.racket = {
    default_config = opts
  }
]]-- end

-- require("lvim.lsp.manager").setup ("racket-langserver", opts)
-- require("lspconfig")["racket"].setup {cmd = {"raco", "-l", "racket-langserver"} }


lspconfig.racket_langserver.setup {
  default_config = opts,
  -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.default()),
}
