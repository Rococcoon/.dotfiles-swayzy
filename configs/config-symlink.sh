#!/bin/bash

# Paths
SOURCE_BASHRC="$HOME/.dotfiles-swayzy/configs/bash/.bashrc"
TARGET_BASHRC="$HOME/.bashrc"

SOURCE_ALACRITTY="$HOME/.dotfiles/configs/alacritty/allacritty.yml"
TARGET_ALACRITTY="$HOME/.config/alacritty/allacritty.yml"

# Function to create a symlink
create_symlink() {
  local source="$1"
  local target="$2"

  if [ -L "$target" ]; then
    echo "Symlink already exists: $target -> $(readlink "$target")"
  elif [ -f "$target" ]; then
    echo "Warning: $target already exists as a regular file."
    read -p "Do you want to replace it with a symlink? (y/n): " confirm
    if [ "$confirm" != "y" ]; then
      echo "Skipping $target"
      return
    fi

    # Backup the original target
    mv "$target" "$target.backup"
    echo "Backup created: $target.backup"
  fi

  # Create the symlink
  ln -s "$source" "$target"
  echo "Symlink created: $target -> $source"
}

# Symlink .bashrc
create_symlink "$SOURCE_BASHRC" "$TARGET_BASHRC"

# Symlink Alacritty config
create_symlink "$SOURCE_ALACRITTY" "$TARGET_ALACRITTY"

# Nice work
echo "Buenos!"
