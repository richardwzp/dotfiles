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
{ 'andweeb/presence.nvim',
  disable = true,
  config = function ()
    require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor LunarVim", -- Text displayed when hovered over the Neovim image
    main_image          = "~/.config/lvim/lunarvim_icon.png",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

    end},
{ 'windwp/nvim-ts-autotag',
    disable=false,
  config = function ()
    require('nvim-ts-autotag').setup()
  end
  },
{ 'lervag/vimtex',
  disable = true,
  config = function ()
  end
  }
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
lvim.builtin.treesitter.autotag.enable = true
-- this is to enable auto tagging

-- strangely this does not show up in the lua lsp suggestion
-- lvim.builtin.nvimtree.setup.open_on_setup_file = true


