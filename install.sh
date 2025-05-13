#!/bin/bash

# Exit on any error
set -e

echo "Installing Display Profiles Switcher..."

# Check for required packages
if ! command -v zenity >/dev/null 2>&1 || ! command -v xrandr >/dev/null 2>&1; then
    echo "Installing required packages..."
    sudo apt install -y x11-xserver-utils zenity
fi

# Create necessary directories
echo "Setting up directories..."
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications

# Make scripts executable
chmod +x display-profiles display-profiles-gui

# Install commands
echo "Installing commands..."
ln -sf "$(pwd)/display-profiles" ~/.local/bin/display-profiles
ln -sf "$(pwd)/display-profiles-gui" ~/.local/bin/display-profiles-gui

# Install configuration
echo "Installing configuration..."
cp display-profiles.conf ~/.local/bin/

# Install desktop entry
echo "Installing desktop entry..."
cp display-profiles.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications/

# Add ~/.local/bin to PATH if not already there
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    echo "Added ~/.local/bin to PATH in ~/.bashrc"
fi

# Update current shell's PATH
export PATH="$HOME/.local/bin:$PATH"

echo "Installation complete!"
echo
echo "Next steps:"
echo "1. Run 'source ~/.bashrc' to update your current shell"
echo "2. Check your display names with: xrandr | grep connected"
echo "3. Edit ~/.local/bin/display-profiles.conf to set up your profiles"
echo "4. Run 'display-profiles-gui' or find 'Display Profiles Switcher' in your applications menu" 