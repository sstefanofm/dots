#! /usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"
export SUDO_ASKPASS="/usr/lib/seahorse/ssh-askpass"
exec dwl
