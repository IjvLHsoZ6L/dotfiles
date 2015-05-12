#! /bin/bash

source /etc/skel/.profile

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi
