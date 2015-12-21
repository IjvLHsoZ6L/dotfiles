#! /bin/bash
# .bash_aliases

# color
alias ls='\ls --color=always'
alias grep='\grep --color=always'
alias less='\less -R'

# list
alias l='ls -CF'
alias la='ls -ACF'
alias ll='ls -hlF'
alias lla='ls -hlAF'
export LC_COLLATE=C

# tree
alias t='tree'
alias tl='tree | less'

# -i option
alias rm='\rm -i'
alias mv='\mv -i'
alias cp='\cp -i'

# copy and paste
alias clip='xclip -selection clipboard'

# re-execute command
alias h='fc -l'
alias r='fc -s'

# change directory with listing
alias cd='cdla'

cdla ()
{
  \cd $@ && la
}
