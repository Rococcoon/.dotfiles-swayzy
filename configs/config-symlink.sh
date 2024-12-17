#!/bin/bash

# Paths
SOURCE="$HOME/.dotfiles-swayzy/configs/bash/.bashrc"
TARGET="$HOME/.bashrc"

# Check if the source file exists
if [ ! -f "$SOURCE" ]; then
  echo "Error: Source file '$SOURCE' does not exist."
  exit 1
fi

# Check if the target already exists
if [ -L "$TARGET" ]; then
  echo "Symlink already exists: $TARGET -> $(readlink "$TARGET")"
  exit 0
elif [ -f "$TARGET" ]; then
  echo "Warning: $TARGET already exists as a regular file."
  read -p "Do you want to replace it with a symlink? (y/n): " confirm
  if [ "$confirm" != "y" ]; then
    echo "Aborting."
    exit 1
  fi
  # Backup the original .bashrc
  mv "$TARGET" "$TARGET.backup"
  echo "Backup created: $TARGET.backup"
fi

# Create the symlink
ln -s "$SOURCE" "$TARGET"
echo "Symlink created: $TARGET -> $SOURCE"
