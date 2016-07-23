setlocal expandtab
setlocal shiftwidth=2

setlocal makeprg=ocamlopt
nnoremap <buffer><silent> ,b :make % -o %:r<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nnoremap <buffer><silent> ,, :! ocaml %<CR>

augroup OCaml
  autocmd!
  autocmd BufWritePost *.ml normal ,b
augroup END
