
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible


""""""""""""""""""
" Menu           "
""""""""""""""""""

" Enable auto completion menu after pressing TAB.
set wildmenu


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


set shiftwidth=4      " Set shift width to 4 spaces.
set tabstop=4         " Set tab width to 4 columns.
set softtabstop=4     " Set tab width to 4 columns.
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







call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()
