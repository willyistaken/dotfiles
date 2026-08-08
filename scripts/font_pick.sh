#!/bin/sh

fc-list  | cut -d\  -f2-99 | cut -d: -f1 | sort -u | tofi |  tr -d '\n' |   wl-copy


pgrep -x dunst >/dev/null && notify-send "Copied!"
