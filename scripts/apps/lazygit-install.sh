#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Install lazygit for Debian 12

# Get the latest version of Lazygit
echo "Fetching the latest version of Lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
echo "Latest Lazygit version: $LAZYGIT_VERSION"

# Download and unpack the tarball
echo "Downloading and unpacking Lazygit..."
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    || { echo "Failed to download Lazygit"; exit 1; }

tar xf lazygit.tar.gz lazygit

# Move the executable to /usr/local/bin
echo "Installing Lazygit to /usr/local/bin..."
sudo install lazygit -D -t /usr/local/bin/ \
    || { echo "Failed to install Lazygit to /usr/local/bin"; exit 1; }

# Clean up
rm lazygit.tar.gz

# Verify installation
if command -v lazygit >/dev/null 2>&1; then
    echo "Lazygit installed successfully in /usr/local/bin!"
else
    echo "Installation encountered issues. Check error messages."
    exit 1
fi
