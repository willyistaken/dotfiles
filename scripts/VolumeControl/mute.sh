#!/usr/bin/zsh

ids=$(pw-cli list-objects | /usr/bin/getPwAudioSinkId)

declare -a array=()
while IFS= read -r line; do
    array+=("$line")
done <<< "$ids"

# Print the array elements (just for verification)
for line in "${array[@]}"; do
	wpctl set-mute $line toggle
done
