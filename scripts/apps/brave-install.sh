#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Installing Brave Browser..."

# Install curl if it's not already installed
echo "Ensuring curl is installed..."
sudo apt update
sudo apt install -y curl || { echo "Failed to install curl"; exit 1; }

# Download the Brave browser keyring
echo "Downloading Brave browser signing key..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg "https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg" \
    || { echo "Failed to download the Brave keyring"; exit 1; }

# Add Brave browser repository to sources
echo "Adding Brave repository to sources list..."
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list \
    || { echo "Failed to add Brave repository to sources list"; exit 1; }

# Update package index
echo "Updating package index..."
sudo apt update || { echo "Failed to update package index"; exit 1; }

# Install Brave browser
echo "Installing Brave browser..."
sudo apt install -y brave-browser \
    || { echo "Failed to install Brave browser"; exit 1; }

echo "Brave browser installation completed successfully!"
