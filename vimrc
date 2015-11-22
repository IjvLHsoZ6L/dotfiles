" Maintainer:  TOUNAI Shouta
" Last Change: 2015 May 17

" guifont
set guifont=Ubuntu\ Mono\ 18
set guifontwide=TakaoGothic\ 18

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
set modeline
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
NeoBundle 'tpope/vim-surround'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'Twinside/vim-hoogle'
NeoBundle 'LaTex-Box-Team/LaTex-Box'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundleCheck
call neobundle#end()

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#keyword_patterns  = { 'default' : '\h\w*' }
inoremap <expr> <Tab>   pumvisible() ? '<C-N>' : '<S-Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<Tab>'
inoremap <expr> <CR>    neocomplete#close_popup() . '<CR>'
inoremap <expr> <C-G>   neocomplete#undo_completion()
inoremap <expr> <C-L>   neocomplete#complete_common_string()

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
