#!/bin/sh

# Get the short hostname (e.g. “pocket” or “framework”)
HOST=$(hostname)

# -------------------------------------------------
# GPD Pocket – the built‑in display is rotated 90°
# -------------------------------------------------
if [ "$HOST" = "pocket" ]; then
    # Rotate the monitor output (eDP‑1) 90° clockwise
    hyprctl keyword monitor "DSI-1,preferred,auto,1.5,transform,3"

    # Rotate the touchscreen input to match the display
    #hyprctl keyword device:0x179ed990:transform 1

# -------------------------------------------------
# Framework Laptop – normal orientation, scaled UI
# -------------------------------------------------
elif [ "$HOST" = "framework" ]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,1.333333"
fi
