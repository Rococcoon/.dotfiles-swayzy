#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Installing Bluetooth packages for Debian 12..."

# Update package index
echo "Updating package index..."
sudo apt update || { echo "Failed to update package index"; exit 1; }

# Install Bluetooth packages
echo "Installing required Bluetooth packages..."
sudo apt install -y blueman bluez pulseaudio-module-bluetooth \
    || { echo "Failed to install Bluetooth packages"; exit 1; }

# Enable and start Bluetooth services
echo "Enabling and starting Bluetooth services..."
sudo systemctl enable bluetooth.service || { echo "Failed to enable Bluetooth service"; exit 1; }
sudo systemctl start bluetooth.service  || { echo "Failed to start Bluetooth service"; exit 1; }

# Enable the Bluetooth module for PulseAudio (optional, for better audio support)
sudo systemctl restart pulseaudio.service || { echo "Failed to restart PulseAudio"; exit 1; }

# Verify Bluetooth service status
echo "Checking Bluetooth service status..."
systemctl status bluetooth.service

echo "Bluetooth setup completed successfully!"
