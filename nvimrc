" .vimrc
"
" Maintainer: Diogo Lisboa
" Created: Sep 22, 2007
" Notes: Ported from .vimrc

call plug#begin('~/.nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
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
set fillchars+=vert:│

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
nmap <C-l> :nohls<cr>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline_skip_empty_sections = 1
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %3l/%L:%3v'

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|public\/system\|public\/assets\|tmp'

" gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
set background=dark
colorscheme gruvbox
hi GruvboxRedSign ctermbg=none
hi GruvboxGreenSign ctermbg=none
hi GruvboxBlueSign ctermbg=none
hi GruvboxYellowSign ctermbg=none
hi GruvboxPurpleSign ctermbg=none
hi GruvboxAquaSign ctermbg=none

" gitgutter
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0
hi SignColumn ctermbg=none

" undotree
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
nnoremap <leader>u :UndotreeToggle<cr>

let g:simplified = 0
function! Simplify()
  if g:simplified
    windo set number
    windo set list
    windo set signcolumn=auto
    hi EndOfBuffer ctermfg=239
    set laststatus=2
    let g:simplified = 0
  else
    windo set nonumber
    windo set nolist
    windo set signcolumn=no
    hi EndOfBuffer ctermfg=bg
    set laststatus=0
    let g:simplified = 1
  endif
endfunction

map <leader>sim :call Simplify()<cr>
