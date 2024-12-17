#!/bin/bash

# install_glfw_wayland.sh

# Define GLFW version and source location
GLFW_VERSION="3.4"
GLFW_DIR="$HOME/.dotfiles-swayzy/scripts/dev/glfw"
INSTALL_DIR="/usr/local"

# Update system and install dependencies
echo "Updating system and installing dependencies..."
sudo apt update
sudo apt install -y cmake git build-essential libxrandr-dev libxi-dev libgl1-mesa-dev libgles2-mesa-dev libx11-dev libxcursor-dev

# Clone or update GLFW source
if [ ! -d "$GLFW_DIR" ]; then
    echo "Cloning GLFW source..."
    git clone https://github.com/glfw/glfw.git "$GLFW_DIR"
else
    echo "Updating GLFW source..."
    cd "$GLFW_DIR"
    git fetch origin
    git checkout "${GLFW_VERSION}"
    git pull origin main
fi

# Navigate to the glfw directory
cd "$HOME/.dotfiles-swayzy/scripts/dev/glfw"

# Clean any previous build artifacts
rm -rf build

# Create a build directory and run CMake with Wayland configuration
mkdir -p build
cd build

echo "Configuring GLFW with Wayland support..."
cmake .. \
    -DGLFW_BUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_WAYLAND=ON \
    -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"

# Compile GLFW
make -j$(nproc)

# Install GLFW
sudo make install

# Cleanup
cd ..
rm -rf build

# Remove the GLFW source directory
rm -rf "$HOME/.dotfiles-swayzy/scripts/dev/glfw"

echo "GLFW installation (Wayland only) completed!"
echo "You may need to link your project with the following libraries:"
echo "  -lglfw -lGL -lX11 -lpthread -ldl"
