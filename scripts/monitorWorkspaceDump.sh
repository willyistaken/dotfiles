#!/usr/bin/zsh

othermonitor=$(hyprctl workspaces -j | jq -r '.[] | .monitor, .id' | grep -m 1 -v "eDP-1")
if [[ "$othermonitor" != "eDP-1" ]]
then
	array=("${(@f)$(hyprctl workspaces -j | jq -r '.[] | .monitor,  .id' | grep "eDP-1" -A 1 | grep -E '^[0-9]+$')}")
	for s in "${array[@]}"; do
		hyprctl dispatch moveworkspacetomonitor $s $othermonitor
	done
fi
