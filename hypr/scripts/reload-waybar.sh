#!/bin/bash
killall -9 waybar
sleep 1
waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css &
