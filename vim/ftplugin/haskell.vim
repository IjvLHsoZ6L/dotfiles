augroup Haskell
  autocmd!
  autocmd BufWritePost * call s:haskellWritePost()
augroup END

function s:haskellWritePost()
  let nr = winbufnr(0)
  GhcModCheck
  if winbufnr(0) == nr
    GhcModLint
  endif
endfunction

nnoremap <buffer><silent> ,, :w \|! runghc %<CR>
nnoremap <buffer><silent> ,b :w \|! ghc -O2 %<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
