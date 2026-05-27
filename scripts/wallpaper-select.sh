#!/usr/bin/env bash

WALLPAPER_DIRS=(
    "$HOME/walls-catppuccin-mocha"
    "$HOME/.config/hypr/wallpapers"
)
CACHE_DIR="$HOME/.cache/wallpaper-thumbs"

mkdir -p "$CACHE_DIR"

pkill wofi 2>/dev/null

mapfile -d '' IMAGES < <(
    for dir in "${WALLPAPER_DIRS[@]}"; do
        [ -d "$dir" ] && find "$dir" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) -print0
    done
)

selected=$(
    for img in "${IMAGES[@]}"; do
        name=$(basename "$img")
        thumb="$CACHE_DIR/${name%.*}.png"

        if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
            magick "$img" -resize 200x112^ -gravity center -extent 200x112 PNG:"$thumb" 2>/dev/null
        fi

        printf 'img:%s:text:%s\n' "$thumb" "$name"
    done | wofi --show dmenu --allow-images --parse-search --prompt "Select Wallpaper" --width 800 --height 600 --columns 4 --cache-file /dev/null -D image_size=200
)

[ -z "$selected" ] && exit 0

selected="${selected#*:text:}"

WALLPAPER=""
for img in "${IMAGES[@]}"; do
    if [ "$(basename "$img")" = "$selected" ]; then
        WALLPAPER="$img"
        break
    fi
done

[ -z "$WALLPAPER" ] && exit 1

hyprctl hyprpaper preload "$WALLPAPER"

while IFS= read -r monitor; do
    hyprctl hyprpaper wallpaper "$monitor,$WALLPAPER"
done < <(hyprctl monitors | sed -n 's/^Monitor //p' | awk '{print $1}')

hyprctl hyprpaper unload unused

HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"
if [ -f "$HYPRPAPER_CONF" ]; then
    sed -i "s|^preload = .*|preload = $WALLPAPER|; s|^wallpaper = .*|wallpaper = ,$WALLPAPER|" "$HYPRPAPER_CONF"
fi

notify-send "Wallpaper" "Set to $(basename "$WALLPAPER")"
