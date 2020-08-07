if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-github-dashboard'
Plug 'tmhedberg/SimpylFold'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ekalinin/Dockerfile.vim'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'yegappan/taglist', { 'on': [ 'Tlist', 'TlistOpen' ] }
Plug 'jnurmine/Zenburn'
call plug#end()

colorscheme zenburn

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" Utilsnips
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<C-space>"
let g:UltiSnipsJumpBackwardTrigger="<A-space>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


let python_highlight_all=1
syntax on


set nu
set rnu

:let mapleader = " "


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


" Flag Unnecessary Whitespace
autocmd BufWritePre *.py,*.pyw,*.c,*.h  %s/\s\+$//e
set encoding=utf-8
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_auto_trigger=1



" NERDTREE UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Open NERDTree with Ctrl M
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif





"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF



let g:slime_python_ipython = 1
let g:slime_target="tmux"


" Exit Taglist if only window
let Tlist_Exit_OnlyWindow = 1


" Fix tmux colors
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen
    set t_ut=
endif

set t_Co=256
 


