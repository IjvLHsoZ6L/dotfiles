setlocal makeprg=ghc\ -O2
nnoremap <buffer> ,, :w \|! runghc %<CR>
nnoremap <buffer> ,b :make -o %< %<CR>
nnoremap <buffer> ,r :! ./%<<CR>
nnoremap <buffer> ,i :w \| GhcModCheck<CR>
nnoremap <buffer> ,t :w \| GhcModType<CR>
nnoremap <buffer> <C-L> :GhcModTypeClear<CR>
