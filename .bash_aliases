#! /bin/bash
# .bash_aliases

# some original settings (not alias)
PS1="\[\e]0;\u : \w\a\]\u:\w $ "
EDITOR=vi
FCEDIT=vi

# color
alias grep='grep --color'
alias less='less -R'

# list
alias l='ls --color -CF'
alias la='ls --color -ACF'
alias ll='ls --color -hlF'
alias lla='ls --color -hlAF'
export LC_COLLATE=C

# -i option
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# re-execute command
alias his='fc -l'
alias r='fc -s'

# change directory with listing
function cd {
  builtin cd "$@" && ls -ACF
}
alias bcd='builtin cd'
