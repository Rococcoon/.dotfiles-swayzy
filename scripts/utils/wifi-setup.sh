#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Installing Wi-Fi packages for Debian 12..."

# Update package index
echo "Updating package index..."
sudo apt update || { echo "Failed to update package index"; exit 1; }

# Install necessary Wi-Fi tools
echo "Installing required Wi-Fi packages..."
sudo apt install -y iwd wireless-tools iw \
    || { echo "Failed to install Wi-Fi packages"; exit 1; }

# Enable and start iwd service
echo "Enabling and starting iwd service..."
sudo systemctl enable iwd.service || { echo "Failed to enable iwd service"; exit 1; }
sudo systemctl start iwd.service  || { echo "Failed to start iwd service"; exit 1; }

# Ensure NetworkManager is installed and enable it
echo "Installing and enabling NetworkManager..."
sudo apt install -y network-manager || { echo "Failed to install NetworkManager"; exit 1; }
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

echo "Wi-Fi setup completed successfully!"
