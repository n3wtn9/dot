set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'wincent/command-t'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Make backspace behave in a sane manner.
set backspace=2
syntax on
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set nobackup
set incsearch
set ignorecase
set nowrap
set textwidth=79
set shiftround

" order matters
let base16colorspace=256
colorscheme desert
set background=dark

" vsplit default to right and below
set splitright
set splitbelow

" show line breaks
" set list
set listchars=eol:¬

" Automatically switch window to current directory.
" This should have less problems than set autochdir.
" If there is wierd behavior with other apps, this might be the problem.
" autocmd BufEnter * silent! lcd %:p:h

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
