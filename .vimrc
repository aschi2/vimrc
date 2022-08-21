if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/plugged')
" tpope plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" Syntax Plugins
Plug 'machakann/vim-sandwich'
Plug 'frazrepo/vim-rainbow'
" Plug 'vim-python/python-syntax'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
" Plug 'pearofducks/ansible-vim'
Plug 'stephpy/vim-yaml'
Plug 'Valloric/YouCompleteMe' "Don't forget to compile!"
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Don't Forget to run :GoInstallBinaries
Plug 'preservim/vim-markdown'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'lervag/vimtex'
" Formatting and Code Insertion Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'FooSoft/vim-argwrap/'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dbeniamine/cheat.sh-vim'
" Navigation Plugins
Plug 'andymass/vim-matchup'
Plug 'tmhedberg/SimpylFold'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'preservim/tagbar' "Don't Forget to install universal ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'easymotion/vim-easymotion'
Plug 'Dimercel/todo-vim'
Plug 'szw/vim-maximizer'
" Aesthetic Plugins
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'wincent/terminus'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jnurmine/Zenburn' "Dont forget to add export TERM=xterm-256color to bashrc or zshrc
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'romainl/Apprentice'
" Debugging Plugins
" Plug 'puremourning/vimspector'
Plug 'jpalardy/vim-slime'
" Other Plugins
Plug 'mbbill/undotree'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'lukhio/vim-mapping-conflicts'
Plug 'andrewstuart/vim-kubernetes'
call plug#end()

"change vim sandwich shortcuts to tpope surround shortcuts
runtime macros/sandwich/keymap/surround.vim

" Set Leader to Space
:let mapleader = " "


" Enable OS Detection
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
	endif


let g:formatterpath = ['~/go/bin']
let g:formatters_python = ['autopep8']
" Don't Forget To install goimports!
let g:formatters_go = ['goimports']
let g:formatters_yaml = ['yq']



set encoding=utf-8
set nowrap
set ignorecase
set smartcase
set smartindent
set nu
set rnu
set hidden
set confirm
set cc=80
set scrolloff=10
set noswapfile
set nobackup
if !isdirectory($HOME."/.vim/.undodir")
    call mkdir($HOME."/.vim/.undodir", "", 0700)
endif
set undodir=~/.vim/.undodir
set undofile
set shiftround

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" " Utilsnips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-w>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"


let g:python_highlight_all = 1
" let python_highlight_all=1
syntax on
" let g:syntastic_ansible_checkers = ['ansible_lint']
" let g:syntastic_ansible_ansible_lint_exec = '/opt/homebrew/bin/ansible-lint'

au BufRead,BufNewFile *.json set filetype=json
" let g:syntastic_json_checkers=['jsonlint']

" let g:syntastic_svelte_checkers = ['javascript/eslint', 'html/htmlhint']


"enable rainbow Parenthesis
let g:rainbow_active = 1


:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Enter Exits locationlist and quickfix
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>


" Fix tmux color !
if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen
	set t_ut=
endif

set t_Co=256

"Set Colorscheme and airline theme, make background clear
" colorscheme dracula
" let g:airline_theme='dracula'

colorscheme apprentice
let g:airline_theme='apprentice'
hi Normal guibg=NONE ctermbg=NONE


"remap for argwrap""
nnoremap <silent> <leader>a :ArgWrap<CR>
" map autoformat to space-p
nnoremap <Leader>p :Autoformat<Enter>


" Enable folding
set foldmethod=indent
set foldlevel=99

""split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split resizing
nnoremap <C-Left> :vertical resize +3<CR>
nnoremap <C-Right> :vertical resize -3<CR>
nnoremap <C-Up> :resize +3<CR>
nnoremap <C-Down> :resize -3<CR>

"undotree remap
nnoremap <leader>u :UndotreeToggle<CR>

"Set default split to split below and to the right
set splitbelow splitright

"Make Visual Selection Indenting Easier

vmap < <gv
vmap > >gv

"shortcut oo as new line without insert
nmap <leader>o o<Esc>k
nmap <leader>O O<Esc>j

"Remap Y to y$ more consistent with D and C
nnoremap Y y$

"Center cursor when searching (zv is to open folds)
nnoremap n nzzzv
nnoremap N Nzzzv

"Undo Breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

"Moving text
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

"Set Maximizer Shortcut

nnoremap <leader>m :MaximizerToggle!<CR>
let g:maximizer_set_default_mapping = 1

"Vimspector Settings
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['vscode-go', 'debugpy']

" Delte Unnecessary Whitespace on save
autocmd BufWritePre *.py,*.pyw,*.c,*.h,*.go  %s/\s\+$//e

"Setup YCM Shortcuts
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>
map <leader>gt  :YcmCompleter GetType<CR>
map <leader>gc  :YcmCompleter RefactorRename 
map <leader>gf  :YcmCompleter FixIt<CR> 
let g:ycm_auto_trigger=1
let g:ycm_confirm_extra_conf = 0


" Vim Go auto type info
let g:go_def_mapping_enabled = 0
" Search For Go Projects
autocmd Filetype go nnoremap <buffer> <leader>gs :GoDeclsDir<CR>
" Search for Everything Else
nnoremap <leader>gs :Tags<CR>

" " NERDTREE UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <Leader>f :NERDTreeToggle<Enter>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
            \   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
            \   bd|
            \   q | endif

"Open/close Todo list
nmap <leader>T :TODOToggle<CR>

"Map FZF to control p 
noremap <C-p> :FZF<CR>
"Search Buffers
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sl :Lines<CR>
nnoremap <leader>sp :Rg<CR>

"Remove CheatSheet Mappings
" let g:CheatSheetDoNotMap=1


"Vim Slime

"let g:slime_python_ipython = 1
" Comment in for  tmux
"et g:slime_target="tmux"
" Comment in for vimterminal
let g:slime_target="vimterminal"
let g:slime_no_mappings = 1
nmap <leader><leader>sc <Plug>SlimeSendCell
nnoremap <leader><leader>sl :SlimeSendCurrentLine<CR>
let g:slime_cell_delimiter = "#%%"




"Config to use Grip as markdown renderer
let vim_markdown_preview_github=1

"Grave Yard, Stuff not used but for some reason I don't want to delete

"
