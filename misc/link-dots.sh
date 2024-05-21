#!/usr/bin/env bash

# force-link-dots
# ./<>/link-dots.sh ./dots

# Get the directory where the script is located
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Loop through each directory in the script's directory
for dir in "$script_dir"/dots/*/; do
    # Get the name of the directory
    dir_name="$(basename "$dir")"

    # Check if the respective folder in ~/.config exists or is a symlink
    if [ -e ~/.config/"$dir_name" ] || [ -L ~/.config/"$dir_name" ]; then
        # If it is, remove it
        rm -rf ~/.config/"$dir_name"
    fi

    # Create a symlink from the directory to the respective folder in ~/.config
    ln -s "$dir" ~/.config/"$dir_name"
done
