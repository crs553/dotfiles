local terminal = "kitty -e tmux"
local fileManager = "thunar"
local menu = "wofi --show drun --conf ~/.config/wofi/config --style ~/.config/wofi/style.css --allow-images"

local M = "SUPER"

-- Basic window management
hl.bind(M .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(M .. " + Q", hl.dsp.window.kill())
hl.bind(M .. " + SHIFT + X", hl.dsp.exit())
hl.bind(M .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(M .. " + SHIFT + E", hl.dsp.exec_cmd("kitty --class yazi -e yazi"))
hl.bind(M .. " + T", hl.dsp.window.float({ action = "toggle" }))

-- App launchers
hl.bind(M .. " + D", hl.dsp.exec_cmd("pkill wofi || " .. menu))
hl.bind(M .. " + SHIFT + P", hl.dsp.exec_cmd("pkill wofi || ~/.dotfiles/scripts/toggle_powermenu.sh"))
hl.bind(M .. " + N", hl.dsp.exec_cmd("pkill wofi || ~/.dotfiles/scripts/toggle_notes_menu.sh"))

-- Layout
hl.bind(M .. " + P", hl.dsp.window.pseudo())
hl.bind(M .. " + Z", hl.dsp.layout("togglesplit"))

-- Focus movement (vim keys)
hl.bind(M .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(M .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(M .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(M .. " + J", hl.dsp.focus({ direction = "d" }))

-- Window movement
hl.bind(M .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(M .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(M .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(M .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Workspace switch
for i = 1, 10 do
  local key = i == 10 and "0" or tostring(i)
  hl.bind(M .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move to workspace
for i = 1, 10 do
  local key = i == 10 and "0" or tostring(i)
  hl.bind(M .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(M .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(M .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(M .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(M .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse move/resize windows
hl.bind(M .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(M .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Fullscreen
hl.bind(M .. " + F", hl.dsp.window.fullscreen())

-- Resize submap
hl.bind(M .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
  hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
  hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
  hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Volume
hl.bind("xf86audiomute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })

-- Media controls
hl.bind("xf86audioplay", hl.dsp.exec_cmd("playerctl play"))
hl.bind("xf86audiopause", hl.dsp.exec_cmd("playerctl pause"))
hl.bind("xf86audionext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("xf86audioprev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("xf86search", hl.dsp.exec_cmd(menu))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png && notify-send \"Screenshot saved\""))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("slurp | grim -g - - | wl-copy && notify-send \"Screenshot copied\""))
hl.bind(M .. " + SHIFT + R", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png && notify-send \"Screenshot saved\""))

-- Brightness
hl.bind("xf86monbrightnessdown", hl.dsp.exec_cmd("brightnessctl -d intel_backlight s 10%-"))
hl.bind("xf86monbrightnessup", hl.dsp.exec_cmd("brightnessctl -d intel_backlight s 10%+"))

-- App shortcuts
hl.bind(M .. " + W", hl.dsp.exec_cmd("pkill wofi || ~/.dotfiles/scripts/wallpaper-select.sh"))
hl.bind(M .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(M .. " + SHIFT + B", hl.dsp.exec_cmd("mullvad-browser"))
hl.bind(M .. " + SHIFT + Escape", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(M .. " + SHIFT + Z", hl.dsp.exec_cmd("signal-desktop"))

-- Reload
hl.bind(M .. " + SHIFT + O", hl.dsp.exec_cmd("systemctl --user restart waybar.service"))
hl.bind(M .. " + SHIFT + M", hl.dsp.exec_cmd("pkill hyprpaper && hyprctl dispatch exec hyprpaper"))

-- Lid switch
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor \"eDP-1, disable\""))
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor \"eDP-1, preferred, auto, 1.333333\""))
