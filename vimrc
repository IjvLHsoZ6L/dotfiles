" Maintainer:  IjvLHsoZ6L
" Last Change: 2015 Dec 4

" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,latin1
set fileformats=unix,mac,dos
scriptencoding utf-8

" for GVim
if has('gui_running')
  set lines=999
  set columns=999
  set guifont=Monospace\ 18
endif

" display
set title
set number
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set display=lastline,uhex
set showmatch
set matchtime=1
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
noremap <Space> <C-D>
nnoremap <C-N> gt
nnoremap <C-P> gT
nnoremap g<C-N> :tabmove +1<CR>
nnoremap g<C-P> :tabmove -1<CR>
nnoremap Y y$
nnoremap <silent> gc :chdir %:p:h \| pwd<CR>
nnoremap <silent> =a :call <SID>indentAllLine()<CR>
function! s:indentAllLine()
  let l:save_cursor = getpos('.')
  normal! gg=G
  call setpos('.', l:save_cursor)
endfunction

" make
nnoremap + ,
nnoremap , <Nop>
nnoremap ,, :make<CR>
nnoremap ,wo :copen<CR>
nnoremap ,wc :cclose<CR>
nnoremap ,l :clist<CR>
nnoremap ,c :cc<CR>
nnoremap ,n :cnext<CR>
nnoremap ,p :cprevious<CR>
augroup SetCompiler
  autocmd!
  autocmd FileType c
        \  compiler gcc
        \| setlocal makeprg=gcc
        \| nnoremap <buffer> ,, :make -o %< %<CR>
        \| nnoremap <buffer> ,r :! ./%<<CR>
  autocmd FileType java
        \  compiler javac
        \| nnoremap <buffer> ,, :make %<CR>
        \| nnoremap <buffer> ,r :! java %<<CR>
  autocmd FileType ocaml
        \  compiler ocaml
        \| setlocal makeprg=ocamlopt
        \| nnoremap <buffer> ,, :w \|! ocaml %<CR>
        \| nnoremap <buffer> ,b :make -o %< %<CR>
        \| nnoremap <buffer> ,r :! ./%<<CR>
        \| nnoremap <buffer> ,i :make -i %<CR>
  autocmd FileType tex
        \  compiler tex
        \| nnoremap <buffer> ,, :make %<CR>
        \| nnoremap <buffer> ,v :! okular %<.pdf &<CR>
  autocmd BufEnter * call <SID>makefile_exists()
augroup END
function! s:makefile_exists()
  if filereadable('Makefile')
    setlocal makeprg=make
    nnoremap <buffer> ,, :make<CR>
    nnoremap <buffer> ,r :make run<CR>
  endif
endfunction

" latex
let g:tex_flavor = 'latex'

" netrw
let g:netrw_list_hide = '\v^\.[^.]'
let g:netrw_sort_sequence = '\v.*'

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-surround'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'raichoo/haskell-vim'
NeoBundle 'IjvLHsoZ6L/indent-ocaml.vim'
NeoBundle 'IjvLHsoZ6L/coq.vim'
NeoBundleCheck
call neobundle#end()

" neocomplcache
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_min_keyword_length           = 3
let g:neocomplcache_min_syntax_length            = 3
let g:neocomplcache_enable_ignore_case           = 1
let g:neocomplcache_enable_smart_case            = 1
let g:neocomplcache_dictionary_filetype_lists    = {
      \ 'java': expand('~/.vim/dict/java.dict'),
      \ 'javascript': expand('~/.vim/dict/javascript.dict'),
      \ 'ocaml': expand('~/.vim/dict/ocaml.dict'),
      \ 'text': expand('~/.vim/ftplugin/tex/keys.dict'),
      \ 'default': '',
      \ }
inoremap <expr> <CR>    neocomplcache#close_popup() . '<CR>'
inoremap <expr> <C-L>   neocomplcache#complete_common_string()
inoremap <expr> <Tab>   pumvisible() ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<S-Tab>'

" neosnippet
let g:neosnippet#snippets_directory = expand('~/.vim/snippets/')
imap <expr> <C-K> neosnippet#expandable_or_jumpable() ?
      \ '<Plug>(neosnippet_expand_or_jump)' : ''
nmap <expr> <C-K> neosnippet#jumpable() ?
      \ 'i<Plug>(neosnippet_jump)' : ''

" unite
nnoremap gb :Unite -tab buffer<CR>
nnoremap gz :Unite -tab file_mru<CR>

" nerdtree
let g:NERDTreeCaseSensitiveSort = 1
nnoremap gn :tabe %:p:h<CR>
nnoremap gN :tabe $HOME<CR>

" colorscheme
set t_Co=16
set background=dark
colorscheme solarized
syntax on

" set on filetype detection
filetype plugin indent on
