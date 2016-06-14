set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Make backspace behave in a sane manner.
set backspace=2
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
set t_Co=256
syntax enable
set background=dark
colorscheme solarized


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

map <C-n> :NERDTreeToggle<CR>

" Synatstic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['flow']

" IndentGuide
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

let g:indent_guide_guide_size=1
