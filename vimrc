" Maintainer:  TOUNAI Shouta
" Last Change: 2015 Mar 30

" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,latin1
set fileformats=unix,mac,dos
scriptencoding utf-8

" for GVim
if has('gui_running')
  set lines=999
  set columns=999
  set guifont=Ubuntu\ Mono\ 18
endif

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
set pumheight=10

" serch, substitute
set incsearch
set ignorecase
set smartcase
set infercase
set gdefault

" indent
set expandtab
set autoindent
set smartindent
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
set modeline
set noswapfile
set confirm
set hidden
set autoread
set autowrite
augroup SetFormatOptions
  autocmd!
  autocmd BufEnter * setlocal formatoptions=Bj
augroup END

" mappings
noremap j gj
noremap k gk
noremap H ^
noremap L $
noremap M %
noremap <Space> <C-D>
nnoremap Y y$
nnoremap , <Nop>
nnoremap + ,
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
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tounaishouta/indent-ocaml.vim'
NeoBundle 'tounaishouta/coq.vim'
NeoBundleCheck
call neobundle#end()

" vimshell.vim
nnoremap <silent> <C-T> :VimShellTab<CR>

" neocomplcache
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_auto_completion_start_length = 1
inoremap <expr> <CR>    neocomplcache#close_popup() . '<CR>'
inoremap <expr> <C-L>   neocomplcache#complete_common_string()
inoremap <expr> <Tab>   pumvisible() ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<S-Tab>'

" neosnippet
let g:neosnippet#snippets_directory = expand('~/.vim/snippets/')
imap <expr> <C-K> neosnippet#expandable_or_jumpable() ? '<Plug>(neosnippet_expand_or_jump)' : ''
nmap <expr> <C-K> neosnippet#jumpable() ? 'i<Plug>(neosnippet_jump)' : ''

" vim2hs
let g:haskell_conceal = 0

" colorscheme
set t_Co=16
set background=dark
colorscheme solarized
syntax on

" set on filetype detection
filetype plugin indent on
