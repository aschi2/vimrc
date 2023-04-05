if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/plugged')
" tpope plugins
Plug 'tpope/vim-sensible'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-repeat'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-vinegar'
" Syntax Plugins
Plug 'machakann/vim-sandwich'
Plug 'frazrepo/vim-rainbow'
"LSP Plugins
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-copilot'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'towolf/vim-helm'
" Formatting and Code Insertion Plugins
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'FooSoft/vim-argwrap/'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'github/copilot.vim'
" Navigation Plugins
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'andymass/vim-matchup'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags' "Don't Forget to install universal ctags
Plug 'Dimercel/todo-vim'
Plug 'ggandor/leap.nvim'
" Aesthetic Plugins
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'folke/twilight.nvim'
Plug 'Pocco81/true-zen.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'jnurmine/Zenburn' "Dont forget to add export TERM=xterm-256color to bashrc or zshrc
" Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'romainl/Apprentice'
" Debugging Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
Plug 'jpalardy/vim-slime'
" Other Plugins
Plug 'mbbill/undotree'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'nvim-lua/plenary.nvim'
Plug 'kkharji/sqlite.lua'
" Plug 'krivahtoo/silicon.nvim', { 'do': './install.sh' }
Plug 'NarutoXY/silicon.lua' , { 'commit': '5c2342502e4fa8423d5fa717851be840bfd9ae85'}
" Plug 'segeljakt/vim-silicon'
call plug#end()

"Import Lua
lua require("config")

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

" Set Neovide Settings
if exists("g:neovide")
	nnoremap <D-v> "*p
	inoremap <D-v> <c-r>+
	let g:neovide_transparency = 0.9
	" let g:transparency = 0.0

endif


set laststatus=3
set nohlsearch
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

" vsnip
" imap <expr> <C-e>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-e>'
" smap <expr> <C-e>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-e>'
" imap <expr> <C-w>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-w>'
" smap <expr> <C-w>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-w>'
" imap <expr> <C-b> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-b>'
" smap <expr> <C-b> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-b>'

au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile Jenkinsfile set filetype=groovy

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

"Set Colorscheme , make background clear
" colorscheme tokyonight
colorscheme catppuccin
let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha

" hi Normal guibg=NONE ctermbg=NONE


"remap for argwrap""
nnoremap <silent> <leader>a :ArgWrap<CR>
" map autoformat to space-p
nnoremap <Leader>p :Autoformat<Enter>


" Enable folding
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

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

"Set Zen Shortcut

nnoremap <leader>m :TZAtaraxis<CR>

" Delte Unnecessary Whitespace on save
autocmd BufWritePre *.py,*.pyw,*.c,*.h,*.go  %s/\s\+$//e


autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
            \   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
            \   bd|
            \   q | endif

"Open/close Todo list
nmap <leader>T :TODOToggle<CR>

"Search Buffers
nnoremap <leader>sf :Telescope git_files<CR>
nnoremap <leader>sb :Telescope buffers<CR>
nnoremap <leader>sl :Telescope live_grep<CR>
nnoremap <leader>st :Telescope tags <CR>
nnoremap <leader>sa :Telescope builtin include_extensions=true<CR>
nnoremap <leader>sp :lua require('telescope').extensions.neoclip.default()<CR>
nnoremap <leader>af :lua vim.lsp.buf.code_action()<CR>


"File Browser
noremap <leader>f :Telescope file_browser<CR>

"BufferPick Mode
nnoremap <leader>b :BufferPick<CR>

"Remove CheatSheet Mappings
" let g:CheatSheetDoNotMap=1

"Vim Slime

"let g:slime_python_ipython = 1
" Comment in for  tmux
"et g:slime_target="tmux"
" Comment in for vimterminal
let g:slime_target="zellij"
let g:slime_no_mappings = 1
nmap <leader><leader>sc <Plug>SlimeSendCell
nnoremap <leader><leader>sl :SlimeSendCurrentLine<CR>
let g:slime_cell_delimiter = "#%%"


"Dap Debugger
nnoremap <F5> :lua require'dap'.continue()<CR>
nnoremap <leader><F5> :lua require'dap'.terminate()<CR>
nnoremap <F9> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>D :lua require'dapui'.toggle()<CR>
nnoremap <F10> :lua require'dap'.step_over()<CR>
nnoremap <F11> :lua require'dap'.step_into()<CR>
nnoremap <leader><F11> :lua require'dap'.step_out()<CR>
nnoremap <leader><F10> :lua require'dap'.step_back()<CR>



"Config to use Grip as markdown renderer
let vim_markdown_preview_github=1


"Silicon to Buffer
vnoremap <C-p> :lua require("silicon").visualise_api({to_clip = true})<CR>
nnoremap <C-p> :lua require("silicon").visualise_api({show_buf = true,to_clip = true})<CR>

" Mapping for copilot panel
nnoremap <leader>h :Copilot panel<CR>

" Add lsp information on hover
nnoremap <C-s> :lua vim.lsp.buf.hover()<CR>


"Grave Yard, Stuff not used but for some reason I don't want to delete

"
