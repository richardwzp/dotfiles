local map = vim.keymap.set
local opt = {noremap = true }

-- additional plugin
lvim.plugins = {
  'mhartington/oceanic-next',
  {'simrat39/symbols-outline.nvim',
   config = function ()
      local sym_opts = require('config.symbol-outline-option')
      require('symbols-outline').setup { sym_opts }
    end},
  {'simrat39/rust-tools.nvim',
   requires = {{'mfussenegger/nvim-dap', opt=false}},
   config = function ()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
  end

  },
}

-- nvimTree
map('n', "\\[",  ':NvimTreeToggle<CR>', opt)
require('config.nvim-tree')
-- termtoggle
map('n', "\\=", ':ToggleTerm<CR>', opt)
map('n', "\\'", ':ToggleTerm direction=float<CR>', opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
lvim.builtin.terminal.size =
  function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end
lvim.builtin.terminal.direction = 'horizontal'
-- symbols-outline
map('n', "\\]", ":SymbolsOutline<CR>", opt)

-- require('config.lua-line').setup()
require('config.lua-line')
require('config.buffer-line')
lvim.builtin.nvimtree.setup.disable_netrw=true
lvim.builtin.nvimtree.setup.hijack_netrw = true
-- treesitter
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
-- this is ftpPlugin's fault. in a python file run :verbose set tabstop?
-- vim.cmd "autocmd FileType python setlocal tabstop=4 shiftwidth=2 softtabstop=2"

