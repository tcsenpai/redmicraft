#! /bin/bash

# Install dependencies
./1_install_deps.sh

# Setup storage
./2_setup_storage.sh

# Download and setup Minecraft server
./3_download_server.sh

# Launch the server
./4_launch.sh
