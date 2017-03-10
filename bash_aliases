#! /bin/bash
# .bash_aliases

# color
alias ls='ls --color=always'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias less='less -R'

# list
alias l='ls -CF'
alias la='ls -ACF'
alias ll='ls -hlF'
alias lla='ls -hlAF'

# tree
alias t='tree -C'

tl ()
{
  tree -C $@ | less
}

# -i option
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

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

# vimagit
alias magit='vim -c MagitOnly'
