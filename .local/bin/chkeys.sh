#! /usr/bin/env bash

#
# stf's
#
# switches keymap between english <-> spanish

get_keymap() {
  setxkbmap -query | grep layout | awk '{ print $2 }'
}

switch() {
  if [ "$1" = "us" ]; then
    setxkbmap es && /sbin/pkill -RTMIN+3 dwmblocks
  else
    setxkbmap us && /sbin/pkill -RTMIN+3 dwmblocks
  fi
}

main() {
  keys=$(get_keymap)
  switch $keys
}

main

