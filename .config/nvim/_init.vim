
""""""""""""""""""
" Editor         "
""""""""""""""""""

set nocompatible            " disable compatibility to old-time vi
set mouse=v                 " middle-click paste with 
set mouse=a                 " enable mouse click
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set backupdir=~/.cache/vim  " Directory to store backup files.
set encoding=UTF-8          " set UTF-8
" set noswapfile            " disable creating swap file
" set cc=80                   " set an 80 column border for good coding style

if (has("termguicolors"))
  set termguicolors
endif

"""" Search
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search


let mapleader = ","

""""""""""""""""""
" Menu           "
""""""""""""""""""
set wildmode
set wildoptions=tagfile


""""""""""""""""""
" File Type      "
""""""""""""""""""

filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
filetype plugin on
" set spell                 " enable spell check (may need to download language package)
"
""""""""""""""""""
" Plugins        "
""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim'
  Plug 'voldikss/vim-floaterm'
" NERDTRee & Cie
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'jiangmiao/auto-pairs'
  Plug 'tmhedberg/SimpylFold'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'

  Plug 'akinsho/toggleterm.nvim'

  " à tester avec lua ?! il a l'air top
  Plug 'Olical/aniseed'
  Plug 'jlesquembre/nterm.nvim'
"  Plug 'akinsho/toggleterm.nvim' 
"  Plug 'PhilRunninger/nerdtree-visual-selection'
"  Plug 'pakutoma/toggle-terminal'
"  colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'wadackel/vim-dogrun'
call plug#end()

""" toggleterm
lua require('toggleterm').setup{}
autocmd TermEnter term://*toggleterm#* 
  \ tnoremap <silent><A-w>m <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><C-w>m <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><C-w><C-m> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

tnoremap <A-w>p <C-\><C-n> :wincmd p<CR>
tnoremap <A-w>w <C-\><C-n> :wincmd w<CR>
tnoremap <A-Up> <C-\><C-n> :wincmd k<CR>
tnoremap <A-Down> <C-\><C-n> :wincmd j<CR>
tnoremap <A-Left> <C-\><C-n> :wincmd h<CR>
tnoremap <A-Right> <C-\><C-n> :wincmd l<CR>

nnoremap <A-Up> :wincmd k<CR>
nnoremap <A-Down> :wincmd j<CR>
nnoremap <A-Left> :wincmd h<CR>
nnoremap <A-Right> :wincmd l<CR>

"""" ColorScheme
set background=dark
colorscheme gruvbox

"""" NERDTRee
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"



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


""""""""""""""""""
" YAML           "
""""""""""""""""""

" folding
autocmd Filetype yaml set foldenable
autocmd Filetype yaml nnoremap <space> za
autocmd Filetype yaml set foldmethod=indent


""""""""""""""""""
" Lua            "
""""""""""""""""""

" folding
autocmd Filetype lua set foldenable
autocmd Filetype lua nnoremap <space> za
autocmd Filetype lua set foldmethod=indent
" indentation
autocmd Filetype lua set tabstop=8
autocmd Filetype lua set shiftwidth=2
autocmd Filetype lua set textwidth=79
autocmd Filetype lua set softtabstop=2

lua require("basic")
lua require("plugins")
