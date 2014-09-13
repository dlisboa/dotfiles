" .vimrc
"
" Maintainer: Diogo Lisboa
" Created: Sep 22, 2007
" Notes: Vim 7.0 and beyond

set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-commentary'
Plugin 'edsono/vim-matchit'
Plugin 'chriskempson/base16-vim'
Plugin 'Lokaltog/vim-powerline'
call vundle#end()

filetype plugin indent on
syntax on

set history=100
set nobackup
set noswapfile
set mouse=a
set encoding=utf-8

set title
set titleold=
set ruler
set number

set backspace=2        " indent,eol,start
set whichwrap+=<,>,h,l
set shortmess=aTsI     " see :help shortmess
set noerrorbells
set visualbell
set scrolloff=3
set sidescroll=3

set autoread
set splitright
set splitbelow
set hidden

set timeoutlen=500
set showmatch
set matchtime=1
set hlsearch
set incsearch
set ignorecase
set list
set listchars=eol:$,trail:·,tab:>·
set laststatus=2

set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set textwidth=80
set linebreak

set virtualedit=block

set background=dark
colorscheme base16-default

if has('gui_running')
  set guioptions=
  set guifont=Menlo:h12
  set linespace=2
endif

hi LineNr ctermbg=0
hi VertSplit ctermbg=0 ctermfg=7
hi MatchParen ctermbg=4 ctermfg=7

au FileType c,h set ts=4 sts=4 sw=4 noet listchars=eol:$,trail:·,tab:\ \ 
au FileType go set ts=8 sts=8 sw=8 noet listchars=eol:$,trail:·,tab:\ \ 
au BufRead irb-interactive* set ft=ruby

let mapleader=","

nmap Y y$
