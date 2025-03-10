#! /bin/bash

xprop WM_CLASS | awk -F'"' '{ print $(NF-1) }' | xclip -i -selection clipboard
