#! /usr/bin/env bash

#
# fresh install dwm

set -e

dwm=~/.config/dwm

rmch() {
  rm -f config.h
}

rmbdh() {
  rm -f blocks.def.h
}

smki() {
  sudo make clean install
}

# dwm
cd $dwm
rmch
smki
rmch

# dmenu
cd $dwm/dmenu
rmch
smki
rmch

# dwmblocks
cd $dwm/dwmblocks
rmbdh
cp blocks.h blocks.def.h
smki
rmbdh
sudo cp udev_rules/* /etc/udev/rules.d/
