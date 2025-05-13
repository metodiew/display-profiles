# Display Profiles Switcher

A simple tool to manage and switch between different display configurations on Linux systems.

## Features

- GUI and command-line interface for switching display profiles
- Configurable display profiles
- Supports multiple displays
- Works with different resolutions and refresh rates
- Desktop integration

## Installation

### Prerequisites
```bash
# Install required packages
sudo apt install x11-xserver-utils zenity
```

### Quick Install (Recommended)
```bash
# Clone the repository
git clone https://github.com/metodiew/display-profiles.git
cd display-profiles

# Run the install script
./install.sh
```

### Manual Installation
1. Clone this repository:
```bash
git clone https://github.com/metodiew/display-profiles.git
cd display-profiles
```

2. Make the scripts executable:
```bash
chmod +x display-profiles display-profiles-gui
```

3. Set up the commands and configuration:
```bash
# Create necessary directories
mkdir -p ~/.local/bin

# Create symbolic links for the commands
ln -sf "$(pwd)/display-profiles" ~/.local/bin/display-profiles
ln -sf "$(pwd)/display-profiles-gui" ~/.local/bin/display-profiles-gui

# Copy the configuration file
cp display-profiles.conf ~/.local/bin/

# Add ~/.local/bin to PATH (if not already in ~/.bashrc)
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

# Update current shell's PATH
export PATH="$HOME/.local/bin:$PATH"
```

4. Install the desktop entry:
```bash
# Create applications directory if it doesn't exist
mkdir -p ~/.local/share/applications/

# Copy and update the desktop entry
cp display-profiles.desktop ~/.local/share/applications/

# Update desktop database
update-desktop-database ~/.local/share/applications/
```

## First Time Setup

1. Check your display names and available modes:
```bash
xrandr | grep connected
```

2. Edit your configuration file:
```bash
nano ~/.local/bin/display-profiles.conf
```

3. Add your display profiles in the format:
```
profile_name|display1_name,display1_mode,display1_rate,display1_pos,display1_primary|display2_name,display2_mode,display2_rate,display2_pos,display2_primary
```

Example configurations:
```
# Laptop only
default|eDP-1,1920x1080,60.00,0x0,true|HDMI-1,off,,,false

# External monitor only
office|HDMI-1,2560x1440,60.00,0x0,true|eDP-1,off,,,false

# Dual display
meeting|HDMI-1,2560x1440,60.00,0x0,false|eDP-1,1920x1080,60.00,156x1440,true
```

## Usage

### GUI Method
- Launch "Display Profiles Switcher" from your applications menu, or
- Run `display-profiles-gui` in terminal
- Select a profile and click OK

### Command Line Method
```bash
# List available profiles
display-profiles --list

# Switch to a profile
display-profiles <profile_name>

# Examples:
display-profiles default
display-profiles office
display-profiles meeting
```

## Troubleshooting

1. If commands are not found:
```bash
# Reload your shell configuration
source ~/.bashrc

# Verify PATH includes ~/.local/bin
echo $PATH
```

2. If the GUI doesn't appear in your applications menu:
```bash
update-desktop-database ~/.local/share/applications
```

3. If display settings aren't working:
```bash
# Check your display names
xrandr | grep connected

# Verify your configuration
cat ~/.local/bin/display-profiles.conf
```

4. For permission issues:
```bash
# Make sure scripts are executable
chmod +x ~/.local/bin/display-profiles*
```

## Uninstallation

To remove the application:
```bash
# Remove commands
rm ~/.local/bin/display-profiles
rm ~/.local/bin/display-profiles-gui
rm ~/.local/bin/display-profiles.conf

# Remove desktop entry
rm ~/.local/share/applications/display-profiles.desktop
update-desktop-database ~/.local/share/applications/
```