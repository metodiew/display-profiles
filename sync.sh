#!/bin/bash

# Sync configuration file to installed location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INSTALLED_CONFIG="$HOME/.local/bin/display-profiles.conf"

if [ ! -f "$SCRIPT_DIR/display-profiles.conf" ]; then
    echo "Error: display-profiles.conf not found in $SCRIPT_DIR"
    exit 1
fi

echo "Syncing display-profiles.conf to installed location..."
cp "$SCRIPT_DIR/display-profiles.conf" "$INSTALLED_CONFIG"
echo "Configuration synced successfully to $INSTALLED_CONFIG"

