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
setlocal indentkeys+=0=(*
setlocal indentkeys+=0=and,0=in,0=then,0=else,0=with,0=do,0=done,0=end
setlocal indentkeys+=\|,),],}
setlocal nolisp

" Only define the function once.
if exists('*GetOCamlIndent')
  finish
endif

function! s:begins_with(line, pat)
  return a:line =~ '\v\C^\s*(' . a:pat . ')'
endfunction

function! s:ends_with(line, pat)
  return a:line =~ '\v\C(' . a:pat . ')\s*$'
endfunction

function! s:contains_only(line, pat)
  return a:line =~ '\v\C^\s*(' . a:pat . ')\s*$'
endfunction

function! s:matchcount(line, pat)
  let mcount = 0
  let mstart = 0
  while 1
    let mend = matchend(a:line, '\v\C(' . a:pat . ')', mstart)
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

function! s:is_beginning(line)
  if s:begins_with(a:line, '\(\*')
    return 1
  elseif s:begins_with(a:line, '<let>|<val>|<method>|<exception>|<external>')
    return 1
  elseif s:begins_with(a:line, '<type>|<class>|<module>|<open>|<include>')
    return 1
  else
    return 0
  endif
endfunction

function! s:is_completed(line)
  if s:ends_with(a:line, '<if>|<then>|<else>|<match>|<try>|<with>|<while>|<for>|<do>')
    return 0
  elseif s:ends_with(a:line, '<begin>|<object>|<struct>|<sig>')
    return 0
  elseif s:ends_with(a:line, '\w|''|"|\)|\]|\}')
    return 1
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

  elseif s:begins_with(line, '<and>|<in>')
    return indent(s:prevmatch(plnum, '<let>', '<in>'))

  elseif s:begins_with(line, '<then>')
    return indent(s:prevmatch(plnum, '<if>', '<then>'))

  elseif s:begins_with(line, '<else>')
    return indent(s:prevmatch(plnum, '<if>', '<else>'))

  elseif s:begins_with(line, '<with>')
    return indent(s:prevmatch(plnum, '<match>|<try>', '<with>'))

  elseif s:begins_with(line, '<do>|<done>')
    return indent(s:prevmatch(plnum, '<while>|<for>', '<done>'))

  elseif s:begins_with(line, '<end>')
    return indent(s:prevmatch(plnum, '<begin>|<object>|<struct>|<sig>', '<end>'))

  elseif s:begins_with(line, ';;')
    return 0

  elseif s:begins_with(line, '\*\)')
    return indent(s:prevmatch(plnum, '\(\*', '\*\)'))

  elseif s:begins_with(line, '\)')
    return indent(s:prevmatch(plnum, '\(', '\)'))

  elseif s:begins_with(line, '\]')
    return indent(s:prevmatch(plnum, '\[', '\]'))

  elseif s:begins_with(line, '\}')
    return indent(s:prevmatch(plnum, '\{', '\}'))

  elseif s:begins_with(line, '\|\]')
    return indent(s:prevmatch(plnum, '\[\|', '\|\]'))

  elseif s:begins_with(line, '\>\]')
    return indent(s:prevmatch(plnum, '\[\<', '\>\]'))

  elseif s:begins_with(line, '\>\}')
    return indent(s:prevmatch(plnum, '\{\<', '\>\}'))

  elseif s:begins_with(line, '\|')
    if s:begins_with(pline, '\|') || s:contains_only(pline, '\)')
      return indent(plnum)
    else
      let pmlnum = s:prevmatch(plnum, '<match>|<try>|<function>|<type>|\(', '\)')
      let pmline = getline(pmlnum)
      if s:begins_with(pmline, '<match>|<try>|<function>')
        return indent(pmlnum)
      else
        return indent(pmlnum) + &shiftwidth
      endif
    endif

  elseif s:ends_with(pline, '<in>|\*\)')
    return indent(plnum)

  elseif s:ends_with(pline, ';;')
    return 0

  elseif s:ends_with(pline, ';')
    return indent(plnum)

  elseif s:begins_with(pline, '\|') && ! s:is_completed(pline)
    return indent(plnum) + 2 * &shiftwidth

  elseif s:is_completed(pline) && s:is_beginning(line)
    try
      let pmlnum = s:prevmatch(plnum, '<begin>|<object>|<struct>|<sig>|\(\*', '<end>|\*\)')
      return indent(pmlnum) + &shiftwidth
    catch 'prevmatch: Not found.'
      return 0
    endtry

  else
    return indent(plnum) + &shiftwidth

  endif

endfunction
