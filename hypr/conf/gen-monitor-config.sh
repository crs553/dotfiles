#!/bin/sh
HOST=$(hostname)

if [ "$HOST" = "pocket" ]; then
    # GPD Pocket settings
    hyprctl keyword monitor "eDP-1,preferred,auto,1,transform,1"
    hyprctl keyword device:Goodix\ Capacitive\ TouchScreen:transform 90
elif [ "$HOST" = "framework" ]; then
    # Framework Laptop settings
    hyprctl keyword monitor "eDP-1, preferred, auto, 1.333333"
fi
