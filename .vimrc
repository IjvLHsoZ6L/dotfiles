" .vimrc
" Vim setting file
" Author: TOUNAI Shouta
" Version: 0.0

" this is Vim not Vi
set nocompatible

" set off filetype detection
filetype off
filetype plugin off
filetype indent off

" display
set t_Co=256
set title
set number
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:~
set ambiwidth=double
set showmatch
set showcmd
set wildmenu

" window
set splitbelow
set splitright
set helpheight=999
set laststatus=2
set cmdheight=3

" serch, substitute
set nohlsearch
set incsearch
set magic
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
noremap j gj
noremap k gk

" editing
set noswapfile
set confirm
set hidden
set autoread
autocmd BufEnter * set formatoptions=Bj

" encoding
set fileencodings=utf-8,euc-jp,sjis,latin1
set fileformats=unix,mac,dos

" netrw
let g:netrw_list_hide = '\v\.[^.]'

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
NeoBundleCheck
call neobundle#end()

" neocomplcache
inoremap <expr> <CR>    neocomplcache#close_popup() . "\<CR>"
inoremap <expr> <C-L>   neocomplcache#complete_common_string()
inoremap <expr> <TAB>   pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_min_keyword_length           = 3
let g:neocomplcache_min_syntax_length            = 3
let g:neocomplcache_enable_ignore_case           = 1
let g:neocomplcache_enable_smart_case            = 1
let g:neocomplcache_dictionary_filetype_lists    = {
      \ 'java': expand('~/.vim/dict/java.dict'),
      \ 'javascript': expand('~/.vim/dict/javascript.dict'),
      \ 'text': expand('~/.vim/vim-tex/keys.dict'),
      \ 'default': '',
      \ }

" neosnippet
imap <expr> <C-K> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : ""
nmap <expr> <C-K> neosnippet#jumpable() ?
      \ "i\<Plug>(neosnippet_jump)" : ""
let g:neosnippet#snippets_directory = expand('~/.vim/snippets/')

" set on filetype detection
filetype on
filetype plugin on
filetype indent on
