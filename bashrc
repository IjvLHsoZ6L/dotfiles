#! /bin/bash

source /etc/skel/.bashrc

export PS1="\[\e]0;Terminal: \w\a\]\n\w\n\[\e[1;35m\]\$ \[\e[0m\]"
export PS2="\[\e[1;35m\]> \[\e[0m\]"
export PS4="\[\e[1;35m\]+ \[\e[0m\]"
export EDITOR=vi
export FCEDIT=vi

if [ -f ~/.dir_colors/dircolors ]; then
  eval $(dircolors ~/.dir_colors/dircolors)
fi
