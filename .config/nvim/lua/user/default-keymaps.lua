--[
-- default key mappings for neovim.
-- The key mappings here are universal non plugin specifics.
--]--


local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- add some convinient hot key
-- add fast window switch 
keymap("", "<C-h>", "<C-w>h", opts)
keymap("", "<C-j>", "<C-w>j", opts)
keymap("", "<C-k>", "<C-w>k", opts)
keymap("", "<C-l>", "<C-w>l", opts)

-- make word into all cap
keymap("i", "<C-u>", "<ESC>bveUea", opts)

-- easier exit for terminal 
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

