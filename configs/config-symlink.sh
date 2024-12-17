#!/bin/bash
# Script to symlink config files
# By: LRBM

set -e  # Exit on any error

# Function to remove existing configurations
remove_existing() {
    local target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Removing existing $target..."
        rm -rf "$target"
    fi
}

# Remove existing configurations
remove_existing ~/.bashrc
remove_existing ~/.config/alacritty
remove_existing ~/.config/sway
remove_existing ~/.config/tmux
remove_existing ~/.vimrc

# Configuration Files Symlinking

# Alacritty
ln -sf ~/.dotfiles-swayzy/configs/alacritty ~/.config/
echo "Old Alacritty configs removed and symlink created."

# bash
ln -sf ~/.dotfiles-swayzy/configs/bash/.bashrc ~/.bashrc
echo "Old .bashrc removed and symlink created."

# Tmux
ln -sf ~/.dotfiles-swayzy/configs/sway ~/.config/
echo "Old tmux.conf removed and symlink created."

# Tmux
ln -sf ~/.dotfiles-swayzy/configs/tmux ~/.config
echo "Old tmux.conf removed and symlink created."

# Vim
ln -sf ~/.dotfiles-swayzy/configs/vim/.vimrc ~/.vimrc
echo "Old vim configs removed and symlink created."

echo "All configuration files symlinked and plugins installed successfully."
