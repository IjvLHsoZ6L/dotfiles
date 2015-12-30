setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=kotlinc
nnoremap <buffer><silent> ,, :make %<CR>

augroup Kotlin
  autocmd!
  autocmd BufWritePost *.kt normal ,,
augroup END
