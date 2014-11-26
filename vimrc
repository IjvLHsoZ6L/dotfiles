" .vimrc
" Vim setting file
" Author: TOUNAI Shouta
" Version: 0.0

" this is Vim not Vi
set nocompatible

" display
set t_Co=256
set title
set number
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set showmatch
set showcmd
set wildmenu
set ambiwidth=double

" window
set laststatus=2
set cmdheight=2

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
nnoremap <silent> =a :call <SID>indentAllLine()<CR>
function! s:indentAllLine()
  let save_cursor = getpos('.')
  normal! gg=G
  call setpos('.', save_cursor)
endfunction

" moving
set scrolloff=4
set sidescrolloff=8
set nostartofline
set virtualedit=all
set backspace=indent,eol,start
noremap j gj
noremap k gk
noremap H ^
noremap L $

" editing
set noswapfile
set confirm
set hidden
set autoread
set autowrite
augroup SetFormatOptions
  autocmd!
  autocmd BufEnter * setlocal formatoptions=Bj
augroup END

" encoding
set fileencodings=utf-8,euc-jp,sjis,latin1
set fileformats=unix,mac,dos

" latex
let g:tex_flavor = 'latex'

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
        \ compiler gcc
        \|setlocal makeprg=gcc
        \|nnoremap <buffer> ,, :make % -o %<<CR>
        \|nnoremap <buffer> ,r :!./%<<CR>
  autocmd FileType haskell
        \ setlocal makeprg=ghc
        \|nnoremap <buffer> ,, :make -O2 % -o %<<CR>
        \|nnoremap <buffer> ,r :!./%<<CR>
  autocmd FileType java
        \ compiler javac
        \|nnoremap <buffer> ,, :make %<CR>
        \|nnoremap <buffer> ,r :!java %<<CR>
  autocmd FileType ocaml
        \ compiler ocaml
        \|setlocal makeprg=ocamlopt
        \|nnoremap <buffer> ,, :!ocaml %<CR>
        \|nnoremap <buffer> ,i :make -i %<CR>
        \|nnoremap <buffer> ,b :make % -o %<<CR>
        \|nnoremap <buffer> ,r :!./%<<CR>
  autocmd FileType tex
        \ compiler tex
        \|setlocal makeprg=pdflatex
        \|nnoremap <buffer> ,, :make %<CR>
        \|nnoremap <buffer> ,v :!evince %<.pdf &<CR>
  autocmd BufEnter * call <SID>make_keybind()
augroup END
function! s:make_keybind()
  if filereadable('Makefile')
    setlocal makeprg=make
    nnoremap <buffer> ,, :make<CR>
    nnoremap <buffer> ,r :make run<CR>
  endif
endfunction

" netrw
let g:netrw_list_hide = '\v^\.[^.]'
let g:netrw_sort_sequence = '\v.*'

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
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
inoremap <expr> <CR>    neocomplcache#close_popup() . "\<CR>"
inoremap <expr> <C-L>   neocomplcache#complete_common_string()
inoremap <expr> <Tab>   pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"

" neosnippet
let g:neosnippet#snippets_directory = expand('~/.vim/snippets/')
imap <expr> <C-K> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : ""
nmap <expr> <C-K> neosnippet#jumpable() ?
      \ "i\<Plug>(neosnippet_jump)" : ""

" colorscheme
syntax on
highlight Search       ctermfg=0
highlight Visual       ctermfg=0
highlight Folded       ctermfg=0
highlight FoldColumn   ctermfg=0
highlight DiffAdd      ctermfg=0
highlight DiffChange   ctermfg=0
highlight DiffDelete   ctermfg=0
highlight SpellBad     ctermfg=0
highlight SpellCap     ctermfg=0
highlight SpellRare    ctermfg=0
highlight SpellLocal   ctermfg=0
highlight CursorColumn ctermfg=0
highlight ColorColumn  ctermfg=0
highlight MatchParen   ctermfg=0

" set on filetype detection
filetype plugin plugin on
