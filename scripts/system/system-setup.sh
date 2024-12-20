#!/bin/bash

# Exit the script immediately if any command exits with a non-zero status
set -e

# Update package list
echo "Updating package list..."
sudo apt update

# Install the required tools

# Install tar (for extracting tar archives)
echo "Installing tar..."
sudo apt install -y tar

# Install gzip (for compression and decompression)
echo "Installing gzip..."
sudo apt install -y gzip

# Install unzip (for extracting .zip files)
echo "Installing unzip..."
sudo apt install -y unzip

# Install wget (for downloading files from the internet)
echo "Installing wget..."
sudo apt install -y wget

# Install curl (for transferring data with URLs)
echo "Installing curl..."
sudo apt install -y curl

# Install git (for version control)
echo "Installing git..."
sudo apt install -y git

# Install GitHub CLI (gh for interacting with GitHub from the terminal)
echo "Installing GitHub CLI (gh)..."
sudo apt install -y gh

# Install ranger (terminal file manager)
echo "Installing ranger..."
sudo apt install -y ranger

# Install mc (Midnight Commander, another terminal file manager)
echo "Installing mc..."
sudo apt install -y mc

# Install clangd (Language server for C/C++ support)
echo "Installing clangd..."
sudo apt install -y clangd

# Install gcc (GNU C Compiler)
echo "Installing gcc..."
sudo apt install -y gcc

# Install g++ (GNU C++ Compiler)
echo "Installing g++..."
sudo apt install -y g++

# Install make (build automation tool)
echo "Installing make..."
sudo apt install -y make

# Install ripgrep (fast search tool)
echo "Installing ripgrep..."
sudo apt install -y ripgrep

# Install tmux (terminal multiplexer)
echo "Installing tmux..."
sudo apt install -y tmux

# Install vim (text editor)
echo "Installing vim..."
sudo apt install -y vim

# Completion message
echo "All tools have been installed successfully!"

# Exit the script
exit 0
