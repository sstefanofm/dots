#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"
export SUDO_ASKPASS="/usr/lib/seahorse/ssh-askpass"

pkill -x slstatus

exec slstatus -s | dwl -s "$HOME/.config/dwl/autostart.sh"
