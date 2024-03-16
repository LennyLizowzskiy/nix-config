#!/usr/bin/env bash

# Check if a path was provided as a parameter
if [ -z "$1" ]; then
  echo "Usage: $0 path"
  exit 1
fi

# Set the source and target directories
src_dir="$1"
target_dir="$HOME/.config"

# Loop through each directory in the source directory
for dir in "$src_dir"/*/; do
  # Set the name of the target directory
  target="$target_dir/$(basename "$dir")"

  # Check if the target directory already exists and is a symbolic link
  if [ -L "$target" ]; then
    # Remove the existing symbolic link
    rm "$target"
  elif [ -d "$target" ]; then
    # Remove the existing directory and all of its contents
    rm -rf "$target"
  fi

  # Create a symbolic link from the target directory to the source directory
  ln -s "$dir" "$target"
done