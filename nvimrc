" .vimrc
"
" Maintainer: Diogo Lisboa
" Created: Sep 22, 2007
" Notes: Ported from .vimrc

call plug#begin('~/.nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'matze/vim-move'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
Plug 'w0rp/ale'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" ruby
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
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
set clipboard+=unnamedplus

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

let mapleader=','
nmap Y y$
nmap Q <nop>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

" gitgutter
set signcolumn=yes

" gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
set background=dark
colorscheme gruvbox

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" undotree
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
nnoremap <leader>u :UndotreeToggle<cr>

" tagbar
nnoremap <leader>t :TagbarToggle<cr>

" vim-easytags
let g:easytags_async = 1

" vim-move
let g:move_key_modifier = 'C'
