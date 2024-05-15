#! /usr/bin/env bash

batt=$(cat /sys/class/power_supply/BAT0/capacity)

echo "$batt% "
