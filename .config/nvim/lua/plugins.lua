-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
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

-- Configurations for Nvim LSP
    use { 'neovim/nvim-lspconfig',
    disable = true,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp'
      },
    config = function ()
      require("lsp_config.nvim_lsp")
    end,
    }


end)
