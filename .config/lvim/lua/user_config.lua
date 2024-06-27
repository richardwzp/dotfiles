vim.cmd "set relativenumber"
lvim.leader = "space"

vim.cmd "set expandtab"

vim.cmd "set shiftwidth=2"
vim.cmd "set softtabstop=2"
-- well, it's a neovim thing? https://github.com/LunarVim/LunarVim/issues/1364
-- https://www.reddit.com/r/lunarvim/comments/sgcptg/lunarvim_keeps_indenting_4_spaces_no_matter_my/

-- lvim.builtin.which_key.setup.plugins.presets.z = true
for pre, _ in pairs(lvim.builtin.which_key.setup.plugins.presets) do
  lvim.builtin.which_key.setup.plugins.presets[pre] = true
end

-- require('config.lua-line').setup()
lvim.builtin.nvimtree.setup.disable_netrw = true
lvim.builtin.nvimtree.setup.hijack_netrw = true
-- treesitter
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
-- this is ftpPlugin's fault. in a python file run :verbose set tabstop?
-- vim.cmd "autocmd FileType python setlocal tabstop=4 shiftwidth=2 softtabstop=2"
lvim.builtin.treesitter.autotag.enable = true
-- this is to enable auto tagging

-- strangely this does not show up in the lua lsp suggestion
-- lvim.builtin.nvimtree.setup.open_on_setup_file = true

lvim.keys.normal_mode["<C-[>"] = "zh"
lvim.keys.normal_mode["<C-]>"] = "zl"

-- lvim.builtin.which_key:
