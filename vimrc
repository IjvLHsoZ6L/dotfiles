" Maintainer:  TOUNAI Shouta
" Last Change: 2015 May 17

" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,latin1
set fileformats=unix,mac,dos
scriptencoding utf-8

" display
set title
set number
set cursorline
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set display=lastline,uhex
set showcmd
set wildmenu
set ambiwidth=double
set laststatus=2
set cmdheight=2

" serch, substitute
set incsearch
set ignorecase
set smartcase
set infercase
set gdefault

" indent
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" moving
set scrolloff=4
set sidescrolloff=8
set nostartofline
set virtualedit=all
set backspace=indent,eol,start

" editing
set noswapfile
set confirm
set hidden
set autoread
set autowrite
set formatoptions=

" mappings
noremap H ^
noremap L $
noremap M %
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap <Space> <C-D>
nnoremap Y y$
nnoremap + ,
nnoremap , <Nop>
nnoremap ,, :make<CR>
nnoremap <C-N> gt
nnoremap <C-P> gT
nnoremap <silent> g<C-N> :tabmove +1<CR>
nnoremap <silent> g<C-P> :tabmove -1<CR>

" netrw
let g:netrw_list_hide = '\v^\.[^.]'
let g:netrw_sort_sequence = '\v.*'

" latex
let g:tex_flavor = 'latex'

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'Twinside/vim-hoogle'
NeoBundle 'LaTex-Box-Team/LaTex-Box'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundleCheck
call neobundle#end()

" neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr> <Tab> neocomplete#complete_common_string()

" neosnippet
let g:neosnippet#snippets_directory = expand('~/.vim/snippets/')
imap <expr> <C-K> neosnippet#expandable_or_jumpable() ? '<Plug>(neosnippet_expand_or_jump)' : ''
nmap <expr> <C-K> neosnippet#jumpable() ? 'i<Plug>(neosnippet_jump)' : ''

" vim2hs
let g:haskell_conceal = 0

" LaTeX-BOX
let g:LatexBox_split_type                   = 'new'
let g:LatexBox_output_type                  = 'pdf'
let g:LatexBox_latexmk_options              = '-pdfdvi'
" let g:LatexBox_latexmk_options              = '-pdfdvi -latex=platex'

" colorscheme
set t_Co=16
set background=dark
colorscheme solarized
syntax on

" set on filetype detection
filetype plugin indent on
