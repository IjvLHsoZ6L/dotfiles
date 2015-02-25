if exists('loaded_tex_vim')
  finish
endif
let loaded_tex_vim = 1

let s:saved_cpopotions = &cpoptions
set cpoptions&vim

"===========================================================
" some options
"===========================================================

let g:tex_conceal = ''

"===========================================================
" compiler settings
"===========================================================

if search('jsarticle', 'n') || search('jarticle', 'n') || search('msjproc', 'n')
  let b:tex_flavor = 'pdfplatex'
else
  let b:tex_flavor = 'pdflatex'
endif

compiler tex

"===========================================================
" command completion
"===========================================================

let s:dict = {}
let s:tail = {}

function! s:addcomp(key, val)
  let s:dict[a:key] = a:val
  for l:i in range(1, len(a:key))
    let s:tail[a:key[(-l:i):]] = 1
  endfor
endfunction

for s:line in readfile(expand('<sfile>:h') . '/commands.txt')
  if !empty(s:line) && s:line[0] !=# '%'
    call s:addcomp(s:line, '\' . s:line)
  endif
endfor

for s:line in readfile(expand('<sfile>:h') . '/abbreviation.txt')
  if !empty(s:line) && s:line[0] !=# '%'
    let s:list = split(s:line)
    let s:val = remove(s:list, 0)
    for s:key in s:list
      call s:addcomp(s:key, s:val)
    endfor
  endif
endfor

if filereadable(expand('%'))
  for s:line in readfile(expand('%'))
    let s:match = matchlist(s:line, '\v^\% (.+) -\> (.+)$')
    if !empty(s:match)
      echomsg 'define completion' s:match[1] '->' s:match[2]
      call s:addcomp(s:match[1], s:match[2])
    endif
  endfor
endif

call writefile(sort(keys(s:dict)), expand('<sfile>:h') . '/keys.dict')

function! s:complete()
  let l:col = col('.')
  if col('.') == 1
    return '\'
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
    return '\'
  endif
  let l:val = s:dict[l:maxkey]
  return repeat("\<BS>", l:maxlen) . l:val
endfunction

inoremap <buffer><expr> <C-J> <SID>complete()

"===========================================================
" environment expansion
"===========================================================

function! s:expenv()
  let l:line = getline('.')
  let l:match = matchlist(l:line, '\v^\s*(\a+\*?)$')
  if !empty(l:match)
    let l:env = l:match[1]
    let l:list = [
          \ printf('\begin{%s}', l:env),
          \ '<`1`>',
          \ printf('\end{%s}<`0`>', l:env),
          \ ]
    call append('.', l:list)
    delete
    execute 'normal!' len(l:list) . '=='
    execute 'normal' "\<C-K>"
    startinsert!
  endif
endfunction

inoremap <buffer><silent> <C-E> <Esc>:call <SID>expenv()<CR>

"===========================================================

let &cpoptions = s:saved_cpopotions
unlet s:saved_cpopotions
