#!/usr/bin/env bash
LIGHT="$HOME/.dotfiles/hypr/wallpaper-light.png"
DARK="$HOME/.dotfiles/hypr/wallpaper-dark.png"
CONF="$HOME/.config/hypr/hyprpaper.conf"
STATE="$HOME/.cache/hyprpaper-mode"

if [[ -f "$STATE" && $(cat "$STATE") == "dark" ]]; then
    TARGET="$LIGHT"
    MODE="light"
else
    TARGET="$DARK"
    MODE="dark"
fi

echo "$MODE" > "$STATE"

# Update config file (block syntax)
TARGET_ESC=$(echo "$TARGET" | sed 's|/|\\/|g')
sed -i "/^wallpaper {/,/^}/ s|^\(\\s*path = \\).*|\\1$TARGET_ESC|" "$CONF"

hyprctl hyprpaper wallpaper ",$TARGET"

notify-send "Wallpaper" "Switched to $(basename "$TARGET")"
