#! /bin/bash

source /etc/skel/.bashrc

PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w - Terminal\a\]\W \$ "
EDITOR=vi
FCEDIT=vi
