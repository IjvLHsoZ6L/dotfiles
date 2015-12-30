#! /bin/bash

source /etc/skel/.profile

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.kotlinc/bin" ]; then
  PATH="$PATH:$HOME/.kotlinc/bin"
fi
