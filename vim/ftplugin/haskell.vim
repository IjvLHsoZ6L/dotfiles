augroup Haskell
  autocmd!
  autocmd BufWritePost * GhcModCheck
  autocmd BufWritePost * GhcModLint
augroup END

nnoremap <buffer><silent> ,, :w \|! runghc %<CR>
nnoremap <buffer><silent> ,b :w \|! ghc -O2 %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
