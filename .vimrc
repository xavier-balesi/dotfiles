
""""""""""""""""""
" Editor         "
""""""""""""""""""

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

set number
set backspace=indent,eol,start
set ruler

" set NERDTree on open
set splitbelow"
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

""""""""""""""""""
" Menu           "
""""""""""""""""""

" Enable auto completion menu after pressing TAB.
set wildmenu
" Set tab info line
set showtabline=2


""""""""""""""""""
" File Type      "
""""""""""""""""""

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on



""""""""""""""""""
" Identation     "
""""""""""""""""""


set shiftwidth=2      " Set shift width to 2 spaces.
set tabstop=2         " Set tab width to 2 columns.
set softtabstop=2     " Set tab width to 2 columns.
set expandtab         " Use space characters instead of tabs.
set autoindent        " Auto indent on new lines
set smartindent       " Active smart ident
set smarttab          " Active smart tab



""""""""""""""""""
" Search         "
""""""""""""""""""

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch



""""""""""""""""""
" Plugins        "
""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'preservim/nerdtree'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'tpope/vim-surround'
  Plugin 'Townk/vim-autoclose'
  Plugin 'vim-python/python-syntax'
  Plugin 'tmhedberg/SimpylFold'
  Plugin 'morhetz/gruvbox'
  Plugin 'PhilRunninger/nerdtree-visual-selection'
  Plugin 'pakutoma/toggle-terminal'
call vundle#end()

" Enable python-syntax plugin
let g:python_highlight_all = 1
" Enable docstring preview (doesn't seems to work)
let g:SimpylFold_docstring_preview = 1
" set your favorite shell
let g:toggle_terminal#command = '/usr/bin/env bash'

let g:ycm_autoclose_preview_window_after_completion = 1

""""""""""""""""""
" ColorScheme    "
""""""""""""""""""

set termguicolors     " enable true colors support
let g:gruvbox_contrast_dark = 'hard' 
set background=dark  " for dark version of theme
colorscheme gruvbox 

""""""""""""""""""
" Remaps         "
""""""""""""""""""

let mapleader = "," " map leader <leader>

" configuration for YouCompleteMe
nmap <leader>f <Plug>(YCMFindSymbolInWorkspace)
nnoremap <leader>gdd    :YcmCompleter GetDoc<CR>
nnoremap <leader>gdc    :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf    :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gip    :YcmCompleter GoToImprecise<CR>

" NERDTree commands
nnoremap <C-t> :NERDTreeToggle<CR>

" toggle-terminal commands
" map <C-@> to toggle
tnoremap <silent> <C-w><C-m> <C-w>:ToggleTerminal<CR><C-w>p
nnoremap <C-w><C-m> :ToggleTerminal<CR>

""""""""""""""""""
" Python         "
""""""""""""""""""

" folding
autocmd Filetype python set foldenable
autocmd Filetype python nnoremap <space> za
autocmd Filetype python set foldmethod=indent
" indentation
autocmd Filetype python set tabstop=8
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set textwidth=79
autocmd Filetype python set softtabstop=4
