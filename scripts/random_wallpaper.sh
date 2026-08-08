#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/dotfiles/wallpaper/photos"
WALL_LOC="$HOME/dotfiles/wallpaper/wallpaper"

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$(readlink -e $WALL_LOC)")" | shuf -n 1)

# symlink somewhere
ln -sf $WALLPAPER $WALL_LOC


hyprpaper
