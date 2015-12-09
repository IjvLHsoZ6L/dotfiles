setlocal expandtab
setlocal shiftwidth=2

nnoremap <buffer><silent> ,, :Latexmk<CR>
nnoremap <buffer><silent> ,, :LatexView<CR>

augroup LaTeX
  autocmd!
  autocmd BufWritePost *.tex Latexmk
augroup END
