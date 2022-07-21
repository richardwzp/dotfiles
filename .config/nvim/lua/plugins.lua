-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  use {'nvim-treesitter/nvim-treesitter', 
	run = ':TSUpdate',
	config = function ()
	    require "nvim-treesitter.configs".setup {
	    tree_docs = {
	    enable = true,
	    spec_config = { jsdoc = { slots = { class = {author = true} } } }
	    }
	}
    end,
	}

  use {'nvim-treesitter/nvim-tree-docs',
	config = function ()
	    require "nvim-treesitter.configs".setup {
	    tree_docs = {
	    enable = true,
	    spec_config = { jsdoc = { slots = { class = {author = true} } } }
	    }
	}
    end,
    }

  use 'romainl/vim-cool'

--[==[  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = [[require('config.telescope_setup')]],
      config = [[require('config.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  } ]==]--



end)
