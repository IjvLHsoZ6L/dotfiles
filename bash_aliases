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

# copy and paste
alias xc='xclip -selection clipboard'
alias xp='xclip -o -selection clipboard'

# re-execute command
alias h='fc -l'
alias r='fc -s'

# change directory with listing
cdla ()
{
  \cd $@ && la
}
alias cd='cdla'

# update
update ()
{
  echo sudo apt-get update
  sudo apt-get update
  echo sudo apt-get dist-upgrade -y
  sudo apt-get dist-upgrade -y
  echo sudo apt-get autoremove -y
  sudo apt-get autoremove -y
  echo sudo apt-get autoclean
  sudo apt-get autoclean
  echo done.
}

# powertop
alias optimize='sudo powertop --auto-tune'

# git recursive
gitr ()
{
  cur=$(pwd)
  if [ -n "$*" ]; then
    option="$*"
  else
    option=status
  fi
  for git in $(find . -name .git); do
    dir=${git%.git}
    \cd $dir
    echo $dir
    git $option
    echo
    \cd $cur
  done
  echo done.
}

gitrs ()
{
  cur=$(pwd)
  sta=0
  for git in $(find . -name .git); do
    dir=${git%.git}
    \cd $dir
    if [ -n "$(git status -s)" ]; then
      echo $dir
      git status -s
      sta=1
    fi
    \cd $cur
  done
  return $sta
}

# clone from github
github ()
{
  for f in $@; do
    git clone git@github.com:tounaishouta/${f}.git
  done
}

# clone from codebreak
codebreak ()
{
  for f in $@; do
    git clone ssh://tounai@git.codebreak.com/tounai/${f}.git
  done
}

# pdfplatex
pdfplatex ()
{
  if platex $@; then
    for arg in $@; do
      if [ -f ${arg%.tex}.dvi ]; then
        dvipdfmx ${arg%.tex}.dvi
      fi
    done
  fi
}

# make password
mkpw ()
{
  chars=()
  for c in {0..9} {a..z} {A..Z}; do
    chars=(${chars[@]} $c)
  done
  len=${#chars[@]}
  for i in {1..10}; do
    echo -n ${chars[$RANDOM % $len]}
  done
  echo
}

alias caps2ctrl="dconf write /org/gnome/desktop/input-sources/xkb-options \"['ctrl:nocaps', 'terminate:ctrl_alt_bksp']\""

# solarize gnome terminal
solarize ()
{
  if [ ! -d ~/Downloads/gnome-terminal-colors-solarized ]; then
    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/Downloads/gnome-terminal-colors-solarized
  fi
  bash ~/Downloads/gnome-terminal-colors-solarized/install.sh
}
