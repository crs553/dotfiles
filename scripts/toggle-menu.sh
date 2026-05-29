#!/bin/sh

if pgrep -x wofi > /dev/null; then
  pkill wofi
else
  "$HOME/.dotfiles/scripts/$1"
fi
