#! /bin/bash
# .bash_aliases

#PS1="\[\e]0;\u : \w\a\]\u:\w $ "

# color
alias grep='\grep --color=always'
alias less='\less -R'

# list
alias ls='\ls --color=always'
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
function cd {
  builtin cd "$@" && ls --color=always -ACF
}
alias bcd='builtin cd'
