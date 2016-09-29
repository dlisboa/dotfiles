" .vimrc
"
" Maintainer: Diogo Lisboa
" Created: Sep 22, 2007
" Notes: Ported from .vimrc

call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'mattn/gist-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/a.vim'
Plug 'mileszs/ack.vim'
Plug 'kassio/neoterm'
Plug 'neovim/node-host'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-eunuch'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot'

" html
Plug 'mattn/emmet-vim', { 'for': 'html' }

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'

" css
Plug 'ap/vim-css-color'

" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" go
Plug 'fatih/vim-go', { 'for': 'go' }

" clojure
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'snoe/nvim-parinfer.js', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
call plug#end()

filetype plugin indent on
syntax on

set history=100
set nobackup
set noswapfile
set mouse=a

set title
set titleold=
set ruler
set number
set clipboard=unnamed

set backspace=2        " indent,eol,start
set whichwrap+=<,>,h,l
set shortmess=aTsI     " see :help shortmess
set noerrorbells
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

au FileType clojure RainbowParentheses

let mapleader=','
nmap Y y$
nmap <silent><C-l> :nohls<cr>
nmap Q <nop>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

let g:gitgutter_sign_column_always = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:parinfer_preview_cursor_scope = 1
let g:javascript_conceal_function = "ƒ"

let g:move_key_modifier = 'C'

let g:emmet_html5 = 1

let g:easytags_async = 1

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
set background=dark
colorscheme gruvbox
