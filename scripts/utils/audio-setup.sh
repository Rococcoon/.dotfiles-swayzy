#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Installing Audio packages for Debian 12..."

# Update package index
echo "Updating package index..."
sudo apt update || { echo "Failed to update package index"; exit 1; }

# Install PulseAudio, Pavucontrol, Alsa tools, and related packages
echo "Installing required audio packages..."
sudo apt install -y pulseaudio pavucontrol alsa-utils alsamixer pactl \
    || { echo "Failed to install audio packages"; exit 1; }

# Enable and start PulseAudio service
echo "Enabling and starting PulseAudio service..."
sudo systemctl enable pulseaudio.service || { echo "Failed to enable PulseAudio service"; exit 1; }
sudo systemctl start pulseaudio.service  || { echo "Failed to start PulseAudio service"; exit 1; }

# Ensure ALSA modules are loaded
echo "Loading ALSA modules..."
sudo alsactl init || { echo "Failed to initialize ALSA"; exit 1; }

# Verify PulseAudio service status
echo "Checking PulseAudio service status..."
systemctl status pulseaudio.service

echo "Audio setup completed successfully!"
