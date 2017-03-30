set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'tpope/vim-rails.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'Townk/vim-autoclose.git'
Plugin 'tpope/vim-markdown.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-bundler.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tsaleh/vim-align.git'
Plugin 'tsaleh/vim-supertab.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'rking/ag.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'freitass/todo.txt-vim'
Plugin 'alexkalish/vim-marked'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'eiginn/netrw'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Scuilion/gradle-syntastic-plugin'
" Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required 

" Enable syntax processing.
syntax on

set encoding=utf-8 " fix nerdtree arrows
set smartindent
set expandtab " tabs are spaces
set showtabline=2
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of tabs in space when editing
set backspace=indent,eol,start
set shiftwidth=2
set wildmenu " visual autocomplete for command menu
set wildmode=list:longest
set history=1000
set showmatch " highlight [{()}]
set showcmd
set title
set ruler
set nofoldenable
set incsearch " search as chars are entered
set hlsearch " highlight search matches
set ignorecase
set smartcase
set mouse=a
set clipboard=unnamed,unnamedplus

set backupdir=~/.tmp
set directory=~/.tmp

set grepprg=ag


" for vim-airline
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = '@'
" let g:airline_powerline_fonts = 1

" for syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['eslint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1

" for vim-ident-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" for vim-json
let g:vim_json_syntax_conceal = 0

" move cursor as expected with wrapped lines
:nmap j gj
:nmap k gk

" Remove trailing whitespace before write.
autocmd BufWritePre * :%s/\\s\\+$//e

" paste mode for insert
set pastetoggle=<C-x>

" Restore cursor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" Ensure 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" set leader
let mapleader = ","

" clear highlighting
map <leader>h :nohl<CR>

" Open ag.vim
nnoremap <leader>a :Ag<space>

" NERDTree
noremap <leader>n :NERDTreeToggle<CR>

" Fix endwise
autocmd FileType ruby,eruby :let g:AutoCloseExpandEnterOn=""

" use solarized
syntax enable
set background=dark
colorscheme solarized

" also set folds to max size
set diffopt=filler,context:1000000

" Rspec.vim mappings
let g:rspec_command = "!zeus rspec {spec}"
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" Preview markdown file in Marked.
command! Marked silent !open -a "Marked.app" "%:p"
