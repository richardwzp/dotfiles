local map = vim.keymap.set
local opt = {noremap = true }

-- additional plugin
lvim.plugins = {
  'mhartington/oceanic-next',
  {'simrat39/symbols-outline.nvim',
   config = function ()
      local sym_opts = require('config.symbol-outline-option')
      require('symbols-outline').setup { sym_opts }
    end}
}

-- nvimTree
map('n', "<leader>[",  ':NvimTreeToggle<CR>', opt)
require('config.nvim-tree')
-- termtoggle
map('n', "<leader>=", ':ToggleTerm<CR>', opt)
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
-- map('n', "<leader>]", ":SymbolsOutline<CR>", opt)

-- require('config.lua-line').setup()
require('config.lua-line')
require('config.buffer-line')
lvim.builtin.nvimtree.setup.disable_netrw=true
lvim.builtin.nvimtree.setup.hijack_netrw = true
