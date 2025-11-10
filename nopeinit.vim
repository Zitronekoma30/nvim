" ======================
" Basic setup
" ======================

" Use space as leader key
let mapleader = " "

" Make sure to use UTF-8
set encoding=utf-8

" Sensible editing behavior
set number              " show line numbers
set relativenumber      " show relative line numbers
set hidden              " allow switching buffers without saving
set smartcase           " smart case search
set ignorecase          " ignore case in search
set incsearch           " live incremental search
set hlsearch            " highlight search matches
set expandtab           " use spaces instead of tabs
set tabstop=4 shiftwidth=4 softtabstop=4
set termguicolors       " enable truecolor support
set clipboard=unnamedplus  " use system clipboard
set mouse=a             " enable mouse in all modes

" ======================
" Key mappings
" ======================

" Quickly save
nnoremap <leader>w :write<CR>

" Quit
nnoremap <leader>q :quit<CR>

" Reload init.vim
nnoremap <leader>r :source $MYVIMRC<CR> :echo "Config reloaded!"<CR>

" Open command line with :norm prefilled (your earlier idea)
nnoremap <leader>n :call feedkeys(":norm ")<CR>

" Toggle search highlighting
nnoremap <leader>h :set hlsearch!<CR>

" ======================
" Visual polish
" ======================

" Set a theme (works even in VSCodeVim)
colorscheme default

" Highlight current line
set cursorline

" ======================
" Optional Neovim tweaks
" ======================

" Filetype detection and indentation
filetype plugin indent on
syntax on

