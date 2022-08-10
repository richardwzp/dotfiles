" vim plugin manager
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhartington/oceanic-next'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ldelossa/litee.nvim'
Plug 'cseelus/vim-colors-lucid'
Plug 'liuchengxu/vista.vim'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'lukas-reineke/indent-blankline.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

source $HOME/.config/nvim/lua/peartree-config.vim
source $HOME/.config/nvim/lua/vim-fugative-config.vim
source $HOME/.config/nvim/lua/nvimTree-config.vim
source $HOME/.config/nvim/lua/coc-nvim-config.vim
source $HOME/.config/nvim/lua/vista.vim

lua require'nvim-tree'.setup {}
lua <<EOF
require('litee.lib').setup({
    tree = {
        icon_set = "codicons"
    },
    panel = {
        orientation = "left",
        panel_size  = 30
    }
})

require('lualine').setup()
require("toggleterm").setup{}
require('bufferline-config')
require('plugins')
EOF




" trying to set bufferline shortcut
nnoremap <silent>[o :BufferLineCycleNext<CR>
nnoremap <silent>[b :BufferLineCyclePrev<CR>
map [w :bdel<CR>

" nvim terminal
nmap \= :ToggleTerm<Cr>

" set theme
colorscheme OceanicNext
highlight Pmenu ctermbg=4

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

