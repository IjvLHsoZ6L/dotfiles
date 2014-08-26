" support your tex file editing with Vim
" Title: vim-tex
" Author: TOUNAI Shouta
" Version: 0.0

if exists('loaded_vim_tex')
  finish
endif
let loaded_vim_tex = 1

let s:saved_cpopotions = &cpoptions
set cpoptions&vim

"============================================================

function! s:writecompile()
  write
  let l:out = split(system('pdflatex -halt-on-error ' . expand('%')), "\n")
  let l:nr = winnr()
  if bufexists('__output__')
    bdelete __output__
  endif
  silent! belowright 8 sview __output__
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal undolevels=-1
  silent! call append('.', l:out)
  delete
  normal! G
  execute l:nr 'wincmd w'
endfunction
nnoremap <silent> <C-@> :call <SID>writecompile()<CR>
inoremap <silent> <C-@> <ESC>:call <SID>writecompile()<CR>

let s:dict = {}
let s:tail = {}
for s:line in readfile(expand('~/.vim/vim-tex/complete.dict'))
  if !empty(s:line) && s:line[0] !=# '%'
    let s:list = split(s:line)
    let s:val = remove(s:list, 0)
    for s:key in s:list
      if has_key(s:dict, s:key)
        echomsg '"' . s:key . '" is already used for ' . s:dict[s:key]
      else
        let s:dict[s:key] = s:val
        for s:i in range(1, len(s:key))
          let s:tail[s:key[(-s:i):]] = 1
        endfor
      endif
    endfor
  endif
endfor
call writefile(sort(keys(s:dict)), expand('~/.vim/vim-tex/keys.dict'))
function! s:complete()
  let l:col = col('.')
  if col('.') == 1
    return ''
  endif
  let l:line = getline('.')[:l:col - 2]
  let l:maxlen = 0
  let l:maxkey = ''
  let l:len = 1
  while l:len < l:col
    let l:key = l:line[(-l:len):]
    if has_key(s:tail, l:key)
      if has_key(s:dict, l:key)
        let l:maxlen = l:len
        let l:maxkey = l:key
      endif
    else
      break
    endif
    let l:len += 1
  endwhile
  if l:maxlen == 0
    return ''
  endif
  let l:val = s:dict[l:maxkey]
  return repeat("\<BS>", l:maxlen) . l:val
endfunction
inoremap <expr> <C-J> <SID>complete()

"============================================================

let &cpoptions = s:saved_cpopotions
unlet s:saved_cpopotions
