#!/usr/bin/zsh

pid=$(hyprctl activewindow | grep pid | tr -d -c 0-9 | grep -o -E '[0-9]+')
kill $pid
