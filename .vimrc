source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set smartindent
set expandtab
set showtabline=2
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set wildmenu
set wildmode=list:longest
set history=1000
set showmatch
set showmode
set showcmd
set title
set ruler
set nofoldenable
set incsearch
set hlsearch
set ignorecase
set smartcase

set backupdir=~/.tmp
set directory=~/.tmp

set grepprg=ack

" display trailing whitespace and all tabs
set listchars=tab:>-,trail:·
set list

" clear highlighting
map <C-h> :nohl<CR>

" move cursor as expected with wrapped lines
noremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Remove trailing whitespace before write.
autocmd BufWritePre * :%s/\\s\\+$//e

" these two maps enable you to press space to move cursor down a screen,
" and press backspace up a screen.
map <space> <C-f>
map <backspace> <C-b>

" You can use - to jump between windows
map - <C-w><C-w>

" paste mode for insert
set pastetoggle=<F2>

" Restore cursor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" set leader
let mapleader = ","

" rails.vim
map <Leader>as :AS<CR>
map <Leader>m :Rmodel
map <Leader>vm :RVmodel
map <Leader>sm :RSmodel
map <Leader>tm :RTmodel
map <Leader>c :Rcontroller
map <Leader>vc :RVcontroller
map <Leader>sc :RScontroller
map <Leader>tc :RTcontroller
map <Leader>v :Rview
map <Leader>vv :RVview
map <Leader>sv :RSview
map <Leader>tv :RTview
map <Leader>h :Rhelper
map <Leader>vh :RVhelper
map <Leader>sh :RShelper
map <Leader>th :RThelper
map <Leader>/ :RT<space>
map <Leader>s :Rscript<space>
map <Leader>sc :Rscript c<CR>
map <Leader>sdb :Rscript db<CR>

" NERDTree
:noremap <leader>n :NERDTreeToggle<CR>

" use solarized
syntax enable
set background=dark
colorscheme solarized
