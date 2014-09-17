#! /bin/bash

source /etc/skel/.profile

if [ -d "$HOME/.mycommand" ]; then
  PATH=$HOME/.mycommand:$PATH
fi
