" .vimrc
"
" Maintainer: Diogo Lisboa
" Created: Sep 22, 2007
" Notes: Vim 7.0 and beyond

set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

let mapleader=","

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'

Bundle 'tpope/vim-fugitive'
"Bundle 'int3/vim-extradite'

Bundle 'vim-scripts/Gundo'
nmap <leader>u :GundoToggle<cr>

Bundle 'vim-scripts/Align'
Bundle 'godlygeek/tabular'

Bundle 'corntrace/bufexplorer'
nmap <leader>b :BufExplorer<CR>

Bundle 'majutsushi/tagbar'

Bundle 'scrooloose/nerdtree'
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

Bundle 'scrooloose/nerdcommenter'

Bundle 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-surround'

Bundle 'edsono/vim-matchit'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'kana/vim-textobj-user'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'nelstrom/vim-textobj-rubyblock'

 " automatically close quotes
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'
Bundle 'ervandew/supertab'

Bundle 'tpope/vim-markdown'
Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

Bundle 'sickill/vim-pasta'

Bundle 'vim-scripts/bufkill.vim'
Bundle 'kien/ctrlp.vim'

Bundle 'bbommarito/vim-slim'

Bundle 'puppetlabs/puppet-syntax-vim'

Bundle 'gcatlin/go-vim'
"Bundle 'klen/python-mode'
Bundle 'derekwyatt/vim-scala'

Bundle 'vim-scripts/slimv.vim'

Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jpo/vim-railscasts-theme'

"Bundle 'msanders/snipmate.vim'

filetype plugin indent on
syntax on
"colorscheme jellybeans

set history=100
set nobackup
set noswapfile
set pastetoggle=<F6>
set mouse=a
set encoding=utf-8

set autoread
set title
set titleold=
set ruler
set number
"set lazyredraw
set backspace=2        " indent,eol,start
set whichwrap+=<,>,h,l
set shortmess=aTsI     " see :help shortmess
set noerrorbells
set visualbell
set scrolloff=3
set sidescroll=3

set splitright
set splitbelow
set hidden

set showmatch
set matchtime=1
set hlsearch
set incsearch
set ignorecase
set list
set listchars=eol:$,trail:·,tab:>·
"set statusline=%f\ \|%{&ff}\|\ %h%m%r%w%=%-14.(%l,%c%V%)\ %P
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

set foldenable
set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^\\s\\+#'  " fold comments
set foldminlines=4
set foldopen-=undo      " don't open folds when you undo stuff

set virtualedit=block

highlight Folded ctermfg=darkgray ctermbg=none
highlight search ctermfg=black ctermbg=yellow

autocmd FileType c,h,cpp,hpp setl cindent ts=4 sts=4 sw=4 noet lcs+=tab:\ \ 
autocmd FileType asm setl ts=8 sts=8 sw=8 noet lcs+=tab:\ \ 
autocmd FileType go setl ts=4 sts=4 sw=4 noet lcs+=tab:\ \ 
autocmd FileType python setl ts=4 sts=4 sw=4
autocmd FileType make,automake setl ts=4 sts=4 sw=4 noet lcs+=tab:\ \ 
autocmd BufRead *.clj let b:delimitMate_quotes="\""
autocmd BufRead *irb-interactive* setl ft=ruby
autocmd BufRead nginx.conf setl ft=nginx

nmap Y y$
nmap Q <nop>
nmap K <nop>
nnoremap <silent> <C-L> :nohls<cr>
" avoid cursor jumping around when joining lines
nnoremap J mzJ`z

" center cursor in the middle of the screen when jumping
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

if has("gui_running")
  colorscheme railscasts
  highlight Folded guifg=#333333 guibg=#2B2B2B
  set guioptions=ace
  set guicursor+=a:blinkon0 " disable blinking cursor
  set guifont=Monaco:h13
  autocmd VimResized * wincmd =
endif

let g:Powerline_symbols='fancy'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_lazy_update=30
