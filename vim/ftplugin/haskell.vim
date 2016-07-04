setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=ghc\ -O2\ -Wall
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nnoremap <buffer><silent> ,i :! ghci %<CR>
nnoremap <buffer><silent> ,, :! runghc %<CR>

augroup Haskell
  autocmd!
  " autocmd BufWritePost *.hs GhcModCheckAndLintAsync
  autocmd BufWritePost *.hs ! ghc-mod check % && ghc-mod lint %
augroup END
