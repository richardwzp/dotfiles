-- additional plugin
lvim.plugins = {
  {
    'bluz71/vim-nightfly-colors',
    name = "nightfly",
    lazy = false,
    priority = 1000
  },
  'mhartington/oceanic-next',
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      local sym_opts = require('config.symbol-outline-option')
      require('symbols-outline').setup { sym_opts }
    end
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = { { 'mfussenegger/nvim-dap', opt = false } },
    -- config = function()
    --   local rt = require("rust-tools")

    --   rt.setup({
    --     server = {
    --       on_attach = function(_, bufnr)
    --         -- Hover actions
    --         vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
    --         -- Code action groups
    --         vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    --       end,
    --     },
    --   })
    -- end

  },
  -- {
  --   'andweeb/presence.nvim',
  --   enable = false,
  --   config = function()
  --     require("presence"):setup({
  --       -- General options
  --       auto_update         = true,                                -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  --       neovim_image_text   = "The One True Text Editor LunarVim", -- Text displayed when hovered over the Neovim image
  --       main_image          = "~/.config/lvim/lunarvim_icon.png",  -- Main image display (either "neovim" or "file")
  --       client_id           = "793271441293967371",                -- Use your own Discord application client id (not recommended)
  --       log_level           = nil,                                 -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  --       debounce_timeout    = 10,                                  -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  --       enable_line_number  = false,                               -- Displays the current line number instead of the current project
  --       blacklist           = {},                                  -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  --       buttons             = true,                                -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  --       file_assets         = {},                                  -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  --       show_time           = true,                                -- Show the timer

  --       -- Rich Presence text options
  --       editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  --       file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  --       git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  --       plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  --       reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  --       workspace_text      = "Working on %s",      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  --       line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
  --     })
  --   end
  -- },
  {
    'windwp/nvim-ts-autotag',
    enable = true,
    -- ** For some reason, adding config causes "K" completion
    -- to call the treesitter setup which will be deprecated.
    -- config = function()
    --   require('nvim-ts-autotag').setup({
    --     opts = {
    --       -- Defaults
    --       enable_close = true,    -- Auto close tags
    --       enable_rename = true,   -- Auto rename pairs of tags
    --       enable_close_on_slash = false -- Auto close on trailing </
    --     },
    --     -- Also override individual filetype configs, these take priority.
    --     -- Empty by default, useful if one of the "opts" global settings
    --     -- doesn't work well in a specific filetype
    --     per_filetype = {
    --       ["html"] = {
    --         enable_close = false
    --       }
    --     }
    --   })
    -- end
  },
  {
    'lervag/vimtex',
    enable = false,
    config = function()
    end
  },
  {
    'iamcco/markdown-preview.nvim',
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  -- {
  --   "danymat/neogen",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   config = true,
  --   enable = false,
  --   -- Uncomment next line if you want to follow only stable versions
  --   -- version = "*"
  -- },
  -- python stuff
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
  { "folke/trouble.nvim",    dependencies = 'nvim-tree/nvim-web-devicons' },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  'fladson/vim-kitty',
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   enable = false,
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- }
}
