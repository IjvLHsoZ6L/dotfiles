let s:cmds = []

function! s:extcmds(list)
  for s:line in a:list
    while 1
      let s:match = matchlist(s:line, '\v\\(\a+)(.*)$')
      if empty(s:match)
        break
      endif
      call add(s:cmds, s:match[1])
      let s:line = s:match[2]
    endwhile
  endfor
endfunction

call s:extcmds(readfile(expand('~/.vim/vim-tex/latex2e.pdf.txt')))
call s:extcmds(readfile(expand('~/.vim/vim-tex/amsmath.pdf.txt')))
call s:extcmds(readfile(expand('~/.vim/vim-tex/mathtools.pdf.txt')))

call sort(s:cmds)

let s:before = s:cmds
let s:cmds = []
let s:prev = ''
for s:cmd in s:before
  if s:cmd !=# s:prev
    call add(s:cmds, s:cmd)
    let s:prev = s:cmd
  endif
endfor

call writefile(s:cmds, expand('~/.vim/vim-tex/commands.txt'))
