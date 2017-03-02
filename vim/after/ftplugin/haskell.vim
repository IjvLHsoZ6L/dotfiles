setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=ghc\ -O2\ -Wall
nnoremap <buffer> <Space>b :make %<CR>
nnoremap <buffer> <Space>r :! ./%:r<CR>
nnoremap <buffer> <Space>i :! ghci %<CR>
nnoremap <buffer> <Space>t :GhcModType<CR>
nnoremap <buffer> <Space>T :GhcModTypeClear<CR>

augroup Haskell
  autocmd!
  autocmd BufWritePost *.hs GhcModCheckAndLintAsync
augroup END
