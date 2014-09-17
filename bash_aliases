#! /bin/bash
# .bash_aliases

#PS1="\[\e]0;\u : \w\a\]\u:\w $ "

# color
alias grep='\grep --color=auto'
alias less='\less -R'

# list
alias ls='\ls --color=auto'
alias l='\ls --color=auto -CF'
alias la='\ls --color=auto -ACF'
alias ll='\ls --color=auto -hlF'
alias lla='\ls --color=auto -hlAF'
LC_COLLATE=C

# -i option
alias rm='\rm -i'
alias mv='\mv -i'
alias cp='\cp -i'

# re-execute command
alias his='\fc -l'
alias r='\fc -s'

# change directory with listing
function cd {
  builtin cd "$@" && ls -ACF
}
alias bcd='builtin cd'
