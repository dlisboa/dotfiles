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
let g:Powerline_symbols='fancy'

"Bundle 'tpope/vim-fugitive'
"Bundle 'int3/vim-extradite'

Bundle 'vim-scripts/Gundo'
nmap <leader>u :GundoToggle<cr>

Bundle 'vim-scripts/bufkill.vim'

Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-surround'

Bundle 'edsono/vim-matchit'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'skalnik/vim-vroom'

Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'

Bundle 'ervandew/supertab'
Bundle 'sickill/vim-pasta'

Bundle 'tpope/vim-markdown'
Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bbommarito/vim-slim'

Bundle 'puppetlabs/puppet-syntax-vim'

Bundle 'gcatlin/go-vim'
Bundle 'derekwyatt/vim-scala'

Bundle 'altercation/vim-colors-solarized'
Bundle 'jpo/vim-railscasts-theme'

Bundle 'tpope/vim-commentary'
Bundle 'wincent/Command-T'
let g:CommandTMaxHeight = 10

Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on
syntax on

set history=100
set nobackup
set noswapfile
set pastetoggle=<F6>
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

set foldenable
set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^\\s\\+#'  " fold comments
set foldminlines=4
set foldopen-=undo      " don't open folds when you undo stuff

set virtualedit=block

set wildignore+=tmp/**
set wildignore+=vendor/bundle/**
set wildignore+=*.png,*.jpg,*.gif,*.gem,*.o

autocmd FileType c,h,cpp,hpp setl cindent ts=4 sts=4 sw=4 noet nolist lcs+=tab:\ \ 
autocmd FileType asm setl ts=8 sts=8 sw=8 noet lcs+=tab:\ \ 
autocmd FileType go setl ts=4 sts=4 sw=4 noet commentstring=\/\/\ %s lcs+=tab:\ \ 
autocmd FileType python setl ts=4 sts=4 sw=4
autocmd FileType make,automake setl ts=4 sts=4 sw=4 noet lcs+=tab:\ \ 
autocmd BufRead *.clj let b:delimitMate_quotes="\""
autocmd BufRead *irb-interactive* setl ft=ruby
autocmd BufRead nginx.conf setl ft=nginx

hi clear Folded
hi Folded ctermfg=darkgray ctermbg=none guifg=#444444
hi clear Search
hi Search gui=underline cterm=underline ctermfg=black ctermbg=yellow

hi clear DiffAdd
hi DiffAdd    cterm=bold ctermfg=green
hi clear DiffChange
hi DiffChange cterm=bold ctermfg=yellow
hi clear DiffDelete
hi DiffDelete cterm=bold ctermfg=red
hi clear DiffText
hi DiffText   cterm=bold,underline ctermfg=magenta

hi clear SpellBad
hi SpellBad ctermfg=red
hi clear SpellCap
hi SpellCap ctermfg=lightblue

hi clear MatchParen
hi MatchParen ctermfg=white ctermbg=blue

hi clear PMenu
hi PMenu ctermfg=white ctermbg=black

hi CommandTSelection ctermfg=red
hi CommandTCharMatched ctermfg=magenta

if has("gui_running")
  colorscheme railscasts
  hi Folded guifg=#333333 guibg=#2B2B2B
  set guioptions=ace
  set guicursor+=a:blinkon0 " disable blinking cursor
  set guifont=Monaco:h13
endif

nmap Y y$
nmap Q <nop>
nmap K <nop>
nnoremap <silent> <C-L> :nohls<cr>
" avoid cursor jumping around when joining lines
nnoremap J mzJ`z

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':bwipeout #'
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>m :call RenameFile()<cr>

noremap <leader>let :silent! .s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/ \| :nohls \| :normal ==<cr>
noremap <leader>iv  :silent! .s/\v(\w+)/@\1 = \1/ \| :nohls \| :normal ==<cr>
