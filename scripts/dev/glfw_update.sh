#!/bin/bash

# update_glfw_wayland.sh

GLFW_DIR="$HOME/.dotfiles-swayzy/scripts/dev/glfw"

# Pull the latest updates from the GLFW repository
if [ -d "$GLFW_DIR" ]; then
    echo "Updating GLFW source..."
    cd "$GLFW_DIR"
    git fetch origin
    git checkout "3.4"
    git pull origin main

    # Clean previous build artifacts
    rm -rf build

    # Reconfigure and rebuild GLFW
    mkdir -p build
    cd build

    cmake .. \
        -DGLFW_BUILD_SHARED_LIBS=ON \
        -DGLFW_BUILD_WAYLAND=ON \
        -DCMAKE_INSTALL_PREFIX="/usr/local"

    make -j$(nproc)
    sudo make install

    cd ..
    rm -rf build

    echo "GLFW has been updated and rebuilt with Wayland support."
else
    echo "GLFW source directory not found. Please run install_glfw_wayland.sh first."
fi
