#!/bin/bash

## Install Neovim AppImage and ripgrep

# Exit immediately if a command exits with a non-zero status
set -e  

## Define variables
NVIM_APP_DIR="/tmp/neovim_app"
NVIM_APP_IMAGE="nvim.appimage"
NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"

## Ensure required tools are installed
echo "Installing required tools..."
sudo apt update
sudo apt install -y curl git ripgrep

## Create temporary directory for Neovim AppImage
mkdir -p "$NVIM_APP_DIR"
cd "$NVIM_APP_DIR"

## Download the Neovim AppImage
echo "Downloading Neovim AppImage..."
curl -L -o "$NVIM_APP_IMAGE" "$NVIM_URL"

## Move the AppImage to /usr/local/bin and make it executable
echo "Moving Neovim AppImage to /usr/local/bin and setting permissions..."
sudo mv "$NVIM_APP_IMAGE" /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim

## Clean up
echo "Cleaning up..."
cd ..
rm -rf "$NVIM_APP_DIR"

## Verify installation
echo "Neovim version:"
nvim --version

echo "Ripgrep installation:"
rg --version

echo "Installation completed!"


