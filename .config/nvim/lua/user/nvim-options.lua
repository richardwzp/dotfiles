
local options = {
    showmatch = true,
    hlsearch = true,
    showmode = true,
    -- Vim is based on Vi. Setting `nocompatible` switches from the default
    -- Vi-compatibility mode and enables useful Vim functionality. This
    -- configuration option turns out not to be necessary for the file named
    -- '~/.vimrc', because Vim automatically enters nocompatible mode if that file
    -- is present. But we're including it here just in case this config file is
    -- loaded some other way (e.g. saved as `foo`, and then Vim started with
    -- `vim -u foo`).
    nocompatible = true,
    -- show line numbers
    number = true,
    -- This enables relative line numbering mode. With both number and
    -- relativenumber enabled, the current line shows the true line number, while
    -- all other lines (above and below) are numbered relative to the current line.
    -- This is useful because you can tell, at a glance, what count is needed to
    -- jump up or down to a particular line, by {count}k to go up or {count}j to go
    -- down.
    relativenumber = true,
    -- Always show the status line at the bottom, even if you only have one window open.
    laststatus = 2

}

vim.cmd "set whichwrap+=<,>"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set matchpairs+=<:>]]
-- If you open this file in Vim, it'll be syntax highlighted for you.
vim.cmd [[syntax on]]
-- vim.opt.syntax = "on"
-- Disable the default Vim startup message.
vim.cmd [[set shortmess+=I]]


for k, v in ipairs(options) do
    vim.opt[k] = v
end
