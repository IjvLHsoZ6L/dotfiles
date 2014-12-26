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

# -i option
alias rm='\rm -i'
alias mv='\mv -i'
alias cp='\cp -i'

# re-execute command
alias his='\fc -l'
alias r='\fc -s'

# change directory with listing
function cdla {
  builtin cd "$@" && la
}
alias cd='cdla'
