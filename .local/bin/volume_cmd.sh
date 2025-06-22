#! /usr/bin/env bash

VOLUME_FILE="$HOME/.cache/last_volume_level"

get_volume() {
  amixer get Master | grep -oP '\[\d+%\]' | head -1 | tr -d '[%]'
}

case "$1" in
  mute)
    current_volume=$(get_volume)

    if [ "$current_volume" -eq 0 ]; then
      # restore previous volume
      if [ -f "$VOLUME_FILE" ]; then
        previous_volume=$(cat "$VOLUME_FILE")
        amixer set Master "${previous_volume}%"
      else
        amixer set Master 50% # fallback
      fi
    else
      # save current volume and mute
      echo "$current_volume" > "$VOLUME_FILE"
      amixer set Master 0%
    fi
    ;;
  up)
    amixer set Master 1%+
    get_volume > "$VOLUME_FILE"
    ;;
  down)
    amixer set Master 1%-
    get_volume > "$VOLUME_FILE"
    ;;
  *)
    echo "Usage: $0 {mute|up|down}"
    exit 1
    ;;
esac
