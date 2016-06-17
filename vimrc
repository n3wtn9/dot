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
Plugin 'janko-m/vim-test'
Plugin 'raimondi/delimitmate'

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
set list
set listchars=eol:¬

" Automatically switch window to current directory.
" This should have less problems than set autochdir.
" If there is wierd behavior with other apps, this might be the problem.
" autocmd BufEnter * silent! lcd %:p:h

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" neerdtree
" au VimEnter *  NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40 

" Synatstic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
" noremap <C-w>e :SyntasticCheck<CR>
" noremap <C-w>f :SyntasticToggleMode<CR>
" To disable warnings use: 
" let g:syntastic_quiet_messages={'level':'warnings'}

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_javascript_checkers = ['flow']
let g:syntastic_javascript_flow_exe = 'flow check-contents'
let g:syntastic_loc_list_height = 5

" IndentGuide
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" move among buffers with CTRL
map <C-K> :bn<CR>
map <C-J> :bp<CR>

" config janko-m/vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" config ctrlp ignore cards
let g:ctrlp_by_filename = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
