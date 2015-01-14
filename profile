#! /bin/bash

source /etc/skel/.profile

if [ -d "$HOME/.mycommand" ]; then
  PATH=$HOME/.mycommand:$PATH
fi

if [ -d "$HOME/.cabal/bin" ]; then
  PATH=$HOME/.cabal/bin:$PATH
fi
