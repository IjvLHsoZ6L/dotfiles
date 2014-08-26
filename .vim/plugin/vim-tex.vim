" set some options
let g:tex_flavor = 'latex'
let g:tex_conceal = ''

" call main.vim
augroup vim-tex
        autocmd!
        autocmd FileType tex runtime vim-tex/main.vim
augroup END
