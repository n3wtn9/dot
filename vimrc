" Make backspace behave in a sane manner.
set backspace=2
syntax on
filetype indent on
filetype plugin on
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
colorscheme desert
set nobackup
set incsearch
set ignorecase
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
autocmd BufEnter * silent! lcd %:p:h
