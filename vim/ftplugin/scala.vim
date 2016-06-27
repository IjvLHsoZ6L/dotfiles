setlocal expandtab
setlocal shiftwidth=2

setlocal makeprg=scalac\ -deprecation\ -feature\ -Xlint
nnoremap <buffer><silent> ,b :make %<CR>
nnoremap <buffer><silent> ,r :! scala %:r<CR>
nnoremap <buffer><silent> ,i :! scala -i %<CR>
nnoremap <buffer><silent> ,, :! scala %<CR>
