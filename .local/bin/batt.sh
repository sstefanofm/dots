#! /usr/bin/env bash

batt="$(cat /sys/class/power_supply/BAT0/capacity)"

icon_batt="󰄌 "
if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then
  icon_batt="󱐋 "
fi

color="\x06" # SchemeBarError (red)
if [ "$batt" -ge 61 ]; then
  color="\x04" # SchemeBarSuccess (green)
elif [ "$batt" -ge 21 ]; then
  color="\x05" # SchemeBarWarning (yellow)
fi
# \x03 SchemeBarNormal

echo -e "$color$icon_batt \x03$batt%"
