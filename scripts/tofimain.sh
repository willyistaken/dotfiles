#!/bin/bash
#
# Author: Mostopha Labib <noncomplete>
# License: MIT

set -e
set -u


#selection=$(hyprctl clients -j | jq -r '.[] | .workspace.id, .title, .class, .address' | awk '{printf "%s ", $0; getline; printf "%s ", $0; getline; printf "[%s] ", $0; getline; printf " (%s)\n", $0}' | tofi --prompt-text="Windows:")
inused=$(hyprctl clients -j | jq -r '.[] | .class, .workspace.id, .address' | awk '{printf "inused: "; printf "%s ", $0; getline;printf "[%s]",$0; getline; printf " (%s)\n", $0}')

apps=$(cat ~/dotfiles/scripts/apps)


actions=$(printf "$inused\n$apps" | tofi | grep -E -o '\(.*\)' | sed 's/[()]//g')

if [[ $actions =~ "0x" ]];
then
	hyprctl dispatch focuswindow address:$actions
else 
	echo $actions | xargs hyprctl dispatch exec
fi
