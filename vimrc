" Maintainer:  TOUNAI Shouta
" Last Change: 2015 May 17

" encoding {{{1
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,latin1
set fileformats=unix,mac,dos
scriptencoding utf-8

" guifont {{{1
set guifont=Monospace\ 18

" display {{{1
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
set foldmethod=marker

" serch, substitute {{{1
set ignorecase
set incsearch
set gdefault

" indent {{{1
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" moving {{{1
set scrolloff=4
set sidescrolloff=8
set nostartofline
set virtualedit=all
set backspace=indent,eol,start

" editing {{{1
set modeline
set noswapfile
set confirm
set hidden
set autoread
set autowrite
set formatoptions=
set clipboard=unnamedplus

" mappings {{{1
noremap  H ^
noremap  L $
map      M %
nnoremap Y y$
noremap  <Space> <C-D>
noremap  n nzz
noremap  N Nzz
noremap  * *zz
noremap  # #zz
noremap  + ,
noremap  , <Nop>
nnoremap ,, :make<CR>
nnoremap ,m :Makefile<CR>
nnoremap <C-N> gt
nnoremap <C-P> gT
nnoremap <silent> g<C-N> :tabmove +1<CR>
nnoremap <silent> g<C-P> :tabmove -1<CR>

command! Makefile call <SID>makefile()
function! s:makefile()
  setlocal makeprg=make
  nmap     <buffer> ,, ,b,r
  nnoremap <buffer> ,b :! make<CR>
  nnoremap <buffer> ,r :! make run<CR>
endfunction

" netrw {{{1
let g:netrw_list_hide = '\v^\.[^.]'
let g:netrw_sort_sequence = ''

" neobundle {{{1
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'jreybert/vimagit'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'lervag/vimtex'
NeoBundle 'neovimhaskell/haskell-vim'
NeoBundle 'udalov/kotlin-vim'
NeoBundleCheck
call neobundle#end()

" neocomplete {{{1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#keyword_patterns  = { 'default' : '\h\w*' }
inoremap <expr> <Tab>   pumvisible() ? '<C-N>' : '<S-Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<Tab>'
inoremap <expr> <CR>    neocomplete#close_popup() . '<CR>'
inoremap <expr> <C-G>   neocomplete#undo_completion()
inoremap <expr> <C-L>   neocomplete#complete_common_string()

" neosnippet {{{1
let g:neosnippet#snippets_directory = expand('~/.vim/snippets/')
imap <expr> <C-K> neosnippet#expandable_or_jumpable() ? '<Plug>(neosnippet_expand_or_jump)' : ''
nmap <expr> <C-K> neosnippet#jumpable() ? 'i<Plug>(neosnippet_jump)' : ''

" vimtex {{{1
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_options = '-pdfdvi'

" colorscheme {{{1
set t_Co=16
set background=dark
colorscheme solarized
syntax on

" .md as markdown
augroup MdAsMarkdown
  autocmd!
  autocmd BufNewFile,BufRead *.md setfiletype markdown
augroup END

" set on filetype detection {{{1
filetype plugin indent on
