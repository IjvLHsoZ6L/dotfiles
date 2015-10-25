setlocal expandtab
setlocal shiftwidth=2

augroup LaTeX
  autocmd!
  autocmd BufWritePost *.tex Latexmk
augroup END
