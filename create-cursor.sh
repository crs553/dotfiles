#!/usr/bin/env zsh

# Define variables
ICONS_DIR="$HOME/.icons"
ZIP_URL="https://github.com/catppuccin/cursors/releases/download/v2.0.0/catppuccin-mocha-sky-cursors.zip"
ZIP_FILE="$ICONS_DIR/catppuccin-mocha-sky-cursors.zip"

# Ensure the .icons directory exists
mkdir -p "$ICONS_DIR"

# Download the zip file quietly, showing errors only
echo "Downloading Catppuccin Mocha Sky cursors..."
curl -Lo "$ZIP_FILE" -sS "$ZIP_URL"

# Verify download
if [[ -f "$ZIP_FILE" ]]; then
    echo "Extracting cursors..."
    unzip -o "$ZIP_FILE" -d "$ICONS_DIR" >/dev/null
    echo "Cleaning up..."
    rm "$ZIP_FILE"
    echo "Cursors installed in $ICONS_DIR"
else
    echo "Download failed."
    exit 1
fi
