#! /usr/bin/env bash

batt=$(cat /sys/class/power_supply/BAT0/capacity)
icon_batt="󰄌 "

if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then
  icon_batt="󱐋 "
fi

echo "$icon_batt $batt% "
