augroup Haskell
  autocmd!
  autocmd BufWritePost *.hs GhcModCheckAndLintAsync
augroup END

setlocal makeprg=ghc\ -O2
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nnoremap <buffer><silent> ,i :! ghci %<CR>
nnoremap <buffer><silent> ,, :! runghc %<CR>
