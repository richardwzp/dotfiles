set showmatch
set hlsearch
set showmode
set matchpairs+=<:>

" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
"new vim plugin"
set runtimepath^=~/.vim/bundle/ctrlp.vim


" personal add from learning
set wildmenu
" now I can use :b partial-file-name
" and it will jump there

set path+=**
" now I can recursively search with : find path*

" ctags can be used now, its brew installed
command! MakeTags !ctags -R .
" the above command will basically index the codebase
" use ^] to jump to tag under cursor
" use g^] to jump to ambiguous tag 
" Use ^t to jump back to the tag stack

" THINGS TO CONSIDER:
" this does not help if you want a visualized list of tags

" AUTOCOMPLETE:
" this is actually goated
" ^n to find anything specified by the complete option 
" ^xn for JUST this file
" ^xf to find all filename
" ^x] to find all tags
" use ^n and ^p to go back and fourth in the same file
" find out more using :help ins-completion

" FILE BROWSING:
let g:netrw_banner=0 " we don't want this?
" apparently not what i want
" let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 " open split to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+' " no idea what this does, got it from youtube
" - open edit view with :edit / :ex
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |newtrw-browse-maps| for more mappings




" the tab space is too long, change it to 4 space
set tabstop=4
set shiftwidth=4
set autoindent
filetype indent on

" vim plugin manager
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'tmsvg/pear-tree'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" pear tree enabled useful functionality
" Pear Tree is enabled for all filetypes by default:
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1


" self configure merlin for ocaml



" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']
let s:opam_configuration = {}
let g:syntastic_ocaml_checkers=['merlin']
" ## end of OPAM user-setup addition for vim / base ## keep this line

" vim auto completion
" ycm config
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" add some fast copy paste hotkey
vnoremap wy "gy 
nnoremap ,p "gp
vnoremap wd "gd

" add some git related command
nnoremap ,gau :Git add -u<CR>
nnoremap ,gc :Git commit<CR>
nnoremap ,gp :Git push<CR>

" SNIPPETS:
" Read an empty HTML tempplate and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
autocmd FileType ocaml nnoremap ,des :MerlinDestruct<CR>


" TIPS:
" ,gf -> open the file that's currently under the cursor
" <ctr> f -> move down an entire page
" <ctr> b -> move up an entire page
" <ctr> u -> move cursor & up half a page
" <ctr> d -> move cursor & down half a page




