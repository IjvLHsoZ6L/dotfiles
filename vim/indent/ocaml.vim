" Vim indent file
" Language:    OCaml
" Maintainer:  IjvLHsoZ6L
" Last Change: 2014 Nov 18

" Only load this indent file when no other was loaded.
if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal indentexpr=GetOCamlIndent()
setlocal indentkeys=!^F,o,O
setlocal indentkeys+=0=let,0=val,0=method,0=exception,0=external
setlocal indentkeys+=0=type,0=class,0=module,0=open,0=include
setlocal indentkeys+=0=(*,0=*)
setlocal indentkeys+=0=and,0=in,0=then,0=else,0=with,0=do,0=done,0=end
setlocal indentkeys+=\|,),},]
setlocal nolisp
setlocal nosmartindent

" Only define the function once.
if exists('*GetOCamlIndent')
  finish
endif

function! s:matchcount(line, pat)
  let mcount = 0
  let mstart = 0
  while 1
    let mend = matchend(a:line, a:pat, mstart)
    if mend == -1
      return mcount
    endif
    let mcount += 1
    let mstart = mend
  endwhile
endfunction

function! s:prevmatch(lnum, pat, negpat)
  let lnum = a:lnum
  let stack = 1
  while 1
    if lnum == 0
      throw 'prevmatch: Not found.'
    endif
    let stack -= s:matchcount(getline(lnum), a:pat)
    let stack += s:matchcount(getline(lnum), a:negpat)
    if stack == 0
      return lnum
    endif
    let lnum = prevnonblank(lnum - 1)
  endwhile
endfunction

function! s:is_begining(line)
  if a:line =~ '\v^\s*\(\*'
    return 1
  elseif a:line =~ '\v^\s*<(let|val|method|exception|external)>'
    return 1
  elseif a:line =~ '\v^\s*<(type|class|module|open|include)>'
    return 1
  else
    return 0
  endif
endfunction

function! s:is_complete(line)
  if a:line =~ '\v<(if|then|else|match|try|with|while|for|do|begin|object|struct|sig)>\s*$'
    return 0
  elseif a:line =~ '\v(\w|"|\)|\}|\])\s*$'
    return 1
  elseif a:line =~ "\v'\s*$"
  else
    return 0
  endif
endfunction

function! GetOCamlIndent()

  let lnum = v:lnum
  let line = getline(lnum)

  let plnum = prevnonblank(lnum - 1)
  let pline = getline(plnum)

  if plnum == 0
    return 0

  elseif line =~ '\v^\s*(<and>|<in>)>'
    return indent(s:prevmatch(plnum, '\v<let>', '\v<in>'))

  elseif line =~ '\v^\s*<then>'
    return indent(s:prevmatch(plnum, '\v<if>', '\v<then>'))

  elseif line =~ '\v^\s*<else>'
    return indent(s:prevmatch(plnum, '\v<if>', '\v<else>'))

  elseif line =~ '\v^\s*<with>'
    return indent(s:prevmatch(plnum, '\v<(match|try)>', '\v<with>'))

  elseif line =~ '\v^\s*(<do>|<done>)'
    return indent(s:prevmatch(plnum, '\v<for>', '\v<done>'))

  elseif line =~ '\v^\s*<end>'
    return indent(s:prevmatch(plnum, '\v(<begin>|<object>|<struct>|<sig>)', '\v<end>'))

  elseif line =~ '\v^\s*;;'
    return 0

  elseif line =~ '\v^\s*\*\)'
    return indent(s:prevmatch(plnum, '\v\(\*', '\v\*\)'))

  elseif line =~ '\v^\s*\)'
    return indent(s:prevmatch(plnum, '\v\(', '\v\)'))

  elseif line =~ '\v^\s*\}'
    return indent(s:prevmatch(plnum, '\v\{', '\v\}'))

  elseif line =~ '\v^\s*\]'
    return indent(s:prevmatch(plnum, '\v\[', '\v\]'))

  elseif line =~ '\v^\s*\>\}'
    return indent(s:prevmatch(plnum, '\v\{\<', '\v\>\}'))

  elseif line =~ '\v^\s*\>\]'
    return indent(s:prevmatch(plnum, '\v\[\<', '\v\>\]'))

  elseif line =~ '\v^\s*\|\]'
    return indent(s:prevmatch(plnum, '\v\[\|', '\v\|\]'))

  elseif line =~ '\v^\s*\|'
    let pmlnum = s:prevmatch(plnum, '\v<match>|<function>|<type>|\(', '\v\)')
    let pmline = getline(pmlnum)
    if pmline =~ '\v^\s*(<match>|<function>)'
      return indent(pmlnum)
    else
      return indent(pmlnum) + &shiftwidth
    endif

  elseif pline =~ '\v(<in>|\*\))\s*$'
    return indent(plnum)

  elseif s:is_begining(line) && s:is_complete(pline)
    try
      let pmlnum = s:prevmatch(plnum, '\v(<begin>|<object>|<struct>|<sig>)', '\v<end>')
      return indent(pmlnum) + &shiftwidth
    catch 'prevmatch: Not found.'
      return 0
    endtry

  elseif pline =~ '\v;;\s*$'
    return 0

  elseif pline =~ '\v;\s*$'
    return indent(plnum)

  else
    return indent(plnum) + &shiftwidth

  endif

endfunction
