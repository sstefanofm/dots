#!/usr/bin/env bash

#
# fresh install dwl

set -e 

dwl=~/.config/dwl
wmenu=~/.config/wmenu

rmch() {
  rm -f config.h
}


cd $dwl
rmch
sudo -A -p "Reinstall dwl and wmenu" make clean install
rmch

cd $wmenu
meson setup --reconfigure build
sudo ninja -C build install
