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
set number
set cursorline
set colorcolumn=80
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set display=lastline,uhex
set showcmd
set wildmenu
set ambiwidth=double
set laststatus=2
set cmdheight=2
set foldmethod=marker
" }}}

" serch, substitute {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault
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
noremap  Y y$
noremap  n nzz
noremap  N Nzz
noremap  * *zz
noremap  # #zz
noremap  , <Nop>
noremap  + ,
nnoremap <C-N> gt
nnoremap <C-P> gT
nnoremap <Space> <C-D>
nnoremap <silent> <Esc> :nohlsearch<CR>
" }}}

" netrw {{{
let g:netrw_list_hide = '\v^\.[^.]'
let g:netrw_sort_sequence = ''
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
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('baabelfish/nvim-nim', {'on_ft': 'nim'})
call dein#add('derekwyatt/vim-scala', {'on_ft': 'scala'})
call dein#add('eagletmt/ghcmod-vim', {'on_ft': 'haskell'})
call dein#add('eagletmt/neco-ghc', {'on_ft': 'haskell'})
call dein#add('elixir-lang/vim-elixir', {'on_ft': 'elixir'})
call dein#add('itchyny/lightline.vim')
call dein#add('itchyny/vim-haskell-indent', {'on_ft': 'haskell'})
call dein#add('jreybert/vimagit')
call dein#add('kchmck/vim-coffee-script', {'on_ft': 'coffee'})
call dein#add('lervag/vimtex', {'on_ft': 'tex'})
call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})
call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
call dein#add('udalov/kotlin-vim', {'on_ft': 'kotlin'})

call dein#end()

filetype plugin indent on

if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif
if dein#check_install()
  call dein#install()
endif
" }}}

" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#keyword_patterns  = { 'default' : '\h\w*' }
inoremap <expr> <Tab>   pumvisible() ? '<C-N>' : '<S-Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-P>' : '<Tab>'
inoremap <expr> <CR>    neocomplete#close_popup() . '<CR>'
inoremap <expr> <C-G>   neocomplete#undo_completion()
inoremap <expr> <C-L>   neocomplete#complete_common_string()
" }}}

" neosnippet {{{
let g:neosnippet#snippets_directory = expand('~/.vim/snippets/')
imap <expr> <C-K> neosnippet#expandable_or_jumpable() ? '<Plug>(neosnippet_expand_or_jump)' : ''
nmap <expr> <C-K> neosnippet#jumpable() ? 'i<Plug>(neosnippet_jump)' : ''
" }}}

" vimtex {{{
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_options = '-pdfdvi'
" }}}

" colorscheme {{{
set t_Co=16
set background=dark
colorscheme solarized
syntax on
" }}}

" .md as markdown {{{
augroup MdAsMarkdown
  autocmd!
  autocmd BufNewFile,BufRead *.md setfiletype markdown
augroup END
" }}}
