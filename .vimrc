set nocompatible

set mouse=a

" utf-8/cp949 support
set encoding=utf-8
set fileencodings=utf-8,cp949

" Activate syntax highlighting
syntax on

" Line numbering
set nu 

" Indendations
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Sync Clipboard
set clipboard=unnamed

" Leader key: , (comma)
let mapleader = ","

" Directory for plugins (Vim-Plug)
call plug#begin('~/.vim/plugged')

" Color scheme
# Plug 'rakr/vim-one'

" File Browsing (NerdTree)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeWinPos = "left"

" leader + rc: open vimrc at new pane at right
noremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>

" Navigate across panes: Ctrl-hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Find current file in tree
nnoremap <C-F> :NERDTreeFind<CR>

" Open Tree
nnoremap <Leader>n :NERDTreeToggle<CR>

" NerdTree shows hidden files (dotfies)
let NERDTreeShowHidden=1

" Auto load NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" commenter
Plug 'scrooloose/nerdcommenter'

" Window swap: Navigate pane + leader-ww
Plug 'wesQ3/vim-windowswap'

" Searching with Ctrl-P
Plug 'kien/ctrlp.vim'

" Syntax Check
Plug 'scrooloose/syntastic'

" Dash Plugin
Plug 'rizzatti/dash.vim'
nmap <silent> <leader>c <Plug>DashGlobalSearch
nmap <silent> <leader>v <Plug>DashSearch

" Polyglot: language packs
Plug 'sheerun/vim-polyglot'

""""""""""""""""""""""""""""""""""" 
"             Python              "
"""""""""""""""""""""""""""""""""""
let python_highlight_all=1

" Prompt to run Python script by <F2>
au FileType python map <F2> : !python %:p 
" Save and Run Python script by <F9>
nnoremap <silent> <F9> :!clear;python %:p<CR>

" autocompletion with deocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
let g:deoplete#enable_at_startup = 1

" go-to-definition / refactor
Plug 'davidhalter/jedi-vim'
let g:jedi#usages_command = "<leader>m"

" Powerline
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" let g:Powerline_symbols = 'fancy'
" set laststatus=2

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Python Syntax/Style checker
" pip install flake8
Plug 'nvie/vim-flake8', {'for': 'python'} " <F7>

" Python Auto-indent
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}


""""""""""""""""""""""""""""""""""" 
"           JavaScript            "
"""""""""""""""""""""""""""""""""""
" JavaScript Syntax, Highliting and Indentation
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'crusoexia/vim-javascript-lib', {'for': 'javascript'}

" Initialize plugin system
call plug#end()

" Neovim-Truecaolor support in Tmux
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Colorscheme
# colorscheme one
set background=dark " for the dark version
" set background=light " for the light version
# let g:airline_theme='one'

" All of your Plugins must be added before the following line
filetype plugin indent on    " required
