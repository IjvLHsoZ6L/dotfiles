#! /bin/bash
# .bash_aliases

# some original settings (not alias)
PS1="\[\e]0;\u : \w\a\]\u:\w $ "
EDITOR=vi
FCEDIT=vi

# list
alias l='ls -CF'
alias la='ls -ACF'
alias ll='ls -hlF'
alias lla='ls -hlAF'
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
