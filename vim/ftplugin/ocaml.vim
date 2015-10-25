setlocal expandtab
setlocal shiftwidth=4

setlocal makeprg=ocamlopt
nnoremap <buffer><silent> ,b :make % -o %:r<CR>
nnoremap <buffer><silent> ,r :! ./%:r<CR>
nmap     <buffer><silent> ,, :! ocaml %<CR>

augroup OCaml
  autocmd!
  autocmd BufWritePost *.ml normal ,b
augroup END
