local which_opts = {
  mode = "n",     -- NORMAL mode
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local map = vim.keymap.set
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- lvim.keys.normal_mode["\\]"] = ":SymbolsOutline<CR>"
require('which-key').register({
  ['\\'] = {
    name = "side-bar toggle",
    ['['] = { ":NvimTreeToggle<CR>", "toggle nvim-tree" },
    -- termtoggle
    ['='] = { ':ToggleTerm<CR>', 'toggle term' },
    ["'"] = { ':ToggleTerm direction=float<CR>', 'float toggle term' },
    -- symbols-outline
    [']'] = { ':SymbolsOutline<CR>', 'open symbol outline' },

  }
}, which_opts)

lvim.builtin.terminal.size =
    function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end
lvim.builtin.terminal.direction = 'horizontal'
