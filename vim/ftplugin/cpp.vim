setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=g++\ -std=c++11\ -Wall\ -O2
nnoremap <buffer> <Space>b :make -o %:r %<CR>
nnoremap <buffer> <Space>r :! ./%:r<CR>

augroup C++
  autocmd!
  autocmd BufWritePost *.cpp make -o %:r % | copen
augroup END
