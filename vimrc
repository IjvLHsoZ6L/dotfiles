" vim: foldmethod=marker

if &compatible
  set nocompatible
endif

" encoding {{{
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,latin1
set fileformats=unix,mac,dos
scriptencoding utf-8
" }}}

" display {{{
set title
set titlestring=%t
set number
set cursorline
set colorcolumn=81
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set display=lastline,uhex
set showcmd
set wildmenu
set ambiwidth=double
set laststatus=2
set guifont=monospace\ 15
" }}}

" substitute, search {{{
set gdefault
set ignorecase
set smartcase
set incsearch
set hlsearch
nohlsearch
" }}}

" indent {{{
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" }}}

" moving {{{
set scrolloff=4
set sidescrolloff=8
set nostartofline
set virtualedit=all
set backspace=indent,eol,start
" }}}

" editing {{{
set modeline
set noswapfile
set confirm
set hidden
set autoread
set autowrite
set clipboard=unnamedplus
" }}}

" mappings {{{
noremap  H ^
noremap  L $
noremap  M %
noremap  n nzz
noremap  N Nzz
noremap  p p`]
vnoremap y y`]
nnoremap Y y$
noremap  * *N
vnoremap * yq/P<CR>N
noremap  # #N
vnoremap # yq?P<CR>N
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" }}}

" dein {{{
let s:dein_dir = expand('~/.vim/dein')
let s:dein_rep = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_rep)
  execute '! git clone https://github.com/Shougo/dein.vim' s:dein_rep
endif
execute 'set runtimepath^=' . s:dein_rep

call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
" CoffeeScript
call dein#add('kchmck/vim-coffee-script', {'on_ft': 'coffee'})
" Elixir
call dein#add('elixir-lang/vim-elixir', {'on_ft': 'elixir'})
" Haskell
call dein#add('eagletmt/ghcmod-vim', {'on_ft': 'haskell'})
call dein#add('eagletmt/neco-ghc', {'on_ft': 'haskell'})
call dein#add('itchyny/vim-haskell-indent', {'on_ft': 'haskell'})
" JavaScript
call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})
" Kotlin
call dein#add('udalov/kotlin-vim', {'on_ft': 'kotlin'})
" Nim
call dein#add('baabelfish/nvim-nim', {'on_ft': 'nim'})
" Rust
call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
" Scala
call dein#add('derekwyatt/vim-scala', {'on_ft': 'scala'})
" TeX
call dein#add('lervag/vimtex', {'on_ft': 'tex'})
" Unite
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
" misc.
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('altercation/vim-colors-solarized')
call dein#add('itchyny/lightline.vim')
call dein#add('jreybert/vimagit')
call dein#add('mhinz/vim-startify')
call dein#add('tpope/vim-surround')
call dein#end()

filetype plugin indent on

if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif
if dein#check_install()
  call dein#install()
endif
" }}}

" TeX {{{
let g:tex_flavor = 'latex'
" }}}

" Unite {{{
nnoremap [unite]  <Nop>
nmap     <Space>u [unite]
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]f :Unite file<CR>
nnoremap [unite]l :Unite line<CR>
nnoremap [unite]m :Unite file_mru<CR>
nnoremap [unite]r :Unite file_rec<CR>
nnoremap [unite]y :Unite history/yank<CR>
augroup Unite
  autocmd!
  autocmd FileType unite nmap <buffer> <Esc><Esc> <Plug>(unite_exit)
augroup END
" }}}

" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr> <Tab>   pumvisible() ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<S-Tab>'
" }}}

" neosnippet {{{
imap <C-K> <Plug>(neosnippet_expand_or_jump)
smap <C-K> <Plug>(neosnippet_jump)
nmap <C-K> i<Plug>(neosnippet_jump)
" }}}

" colorscheme {{{
set t_Co=16
set background=dark
colorscheme solarized
syntax on
" }}}
