#!/bin/sh

grep -v "#" ~/dotfiles/scripts/emoji_list | tofi | awk '{print $1}' | tr -d '\n' |   wl-copy

pgrep -x dunst >/dev/null && notify-send "Copied!"
