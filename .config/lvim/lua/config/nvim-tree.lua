-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
-- lvim.g.loaded_netrw = 1
-- lvim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- lvim.opt.termguicolors = true


--[[require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
]]--
local map = vim.keymap.set
local opt = {noremap = true }
map('n', "<leader>[",  ':NvimTreeToggle<CR>', opt)
-- lvim.keys.normal_mode["<leader>["] = ":NvimTreeToggle"


