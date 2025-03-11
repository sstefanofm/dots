#! /usr/bin/env bash

vol="$(amixer get Master | grep -o '[0-9]*%' | cut -d% -f1)"
icon=" " # default

if [ "$vol" -ge 55 ]; then
  icon=""
elif [ "$vol" -ge 10 ]; then
  icon=""
fi

echo "$icon  $vol%"
