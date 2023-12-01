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
    setxkbmap es
  else
    setxkbmap us
  fi
}

main() {
  keys=$(get_keymap)
  switch $keys
}

main

