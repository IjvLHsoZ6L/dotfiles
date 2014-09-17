#! /bin/bash

source /etc/skel/.bashrc

PS1="$(echo "$PS1" | sed 's/@\\h//g')"
EDITOR=vi
FCEDIT=vi
