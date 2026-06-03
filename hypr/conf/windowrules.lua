hl.window_rule({
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  match = { class = "org\\.oe-f\\." },
  suppress_event = "fullscreen",
})

hl.window_rule({
  match = { class = "kitty" },
  workspace = "1",
})

hl.window_rule({
  match = { class = "terminator" },
  workspace = "1",
})

hl.window_rule({
  match = { class = "org\\.mozilla\\.firefox" },
  workspace = "2",
})

hl.window_rule({
  match = { class = "firefox" },
  workspace = "2",
})

hl.window_rule({
  match = { class = "brave-browser" },
  workspace = "2",
})

hl.window_rule({
  match = { class = "Mullvad Browser" },
  workspace = "2",
})

hl.window_rule({
  match = { class = "org\\.qutebrowser\\.qutebrowser" },
  workspace = "2",
})

hl.window_rule({
  match = { class = "bruno" },
  workspace = "3",
})

hl.window_rule({
  match = { class = "codium-url-handler" },
  workspace = "3",
})

hl.window_rule({
  match = { class = "code" },
  workspace = "3",
})

hl.window_rule({
  match = { class = "codium" },
  workspace = "3",
})

hl.window_rule({
  match = { class = "org\\.gnome\\.Nautilus" },
  workspace = "4",
})

hl.window_rule({
  match = { class = "org\\.kde\\.dolphin" },
  workspace = "4",
})

hl.window_rule({
  match = { class = "nemo" },
  workspace = "4",
})

hl.window_rule({
  match = { class = "yazi" },
  workspace = "4",
})

hl.window_rule({
  match = { class = "thunar" },
  workspace = "4",
})

hl.window_rule({
  match = { class = "signal" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "Signal" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "org\\.signal\\.Signal" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "discord" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "Slack" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "telegram-desktop" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "Element" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "ferdi" },
  workspace = "5",
})

hl.window_rule({
  match = { class = "obsidian" },
  workspace = "6",
})

hl.window_rule({
  match = { class = "@joplin/app-desktop" },
  workspace = "6",
})

hl.window_rule({
  match = { class = "ONLYOFFICE" },
  workspace = "6",
})

hl.window_rule({
  match = { class = "org\\.oe-f\\." },
  workspace = "6",
})

hl.window_rule({
  match = { initial_title = "Excalidraw" },
  workspace = "6",
})

hl.window_rule({
  match = { initial_title = "Vikunja" },
  workspace = "6",
})

hl.window_rule({
  match = { class = "Spotify" },
  workspace = "7",
})

hl.window_rule({
  match = { class = "vlc" },
  workspace = "7",
})

hl.window_rule({
  match = { class = "mpv" },
  workspace = "7",
})

hl.window_rule({
  match = { title = "Navidrome" },
  workspace = "7",
})

hl.window_rule({
  match = { class = "blueman-manager" },
  float = true,
})

hl.window_rule({
  match = { class = "blueman-manager" },
  size = "35% 45%",
})

hl.window_rule({
  match = { class = "blueman-manager" },
  center = true,
})

hl.window_rule({
  match = { class = "\\.blueman-manager-wrapped" },
  float = true,
})

hl.window_rule({
  match = { class = "\\.blueman-manager-wrapped" },
  size = "35% 45%",
})

hl.window_rule({
  match = { class = "\\.blueman-manager-wrapped" },
  center = true,
})

hl.window_rule({
  match = { class = "org\\.pulseaudio\\.pavucontrol" },
  float = true,
})

hl.window_rule({
  match = { class = "org\\.pulseaudio\\.pavucontrol" },
  size = "35% 45%",
})

hl.window_rule({
  match = { class = "org\\.pulseaudio\\.pavucontrol" },
  center = true,
})

hl.window_rule({
  match = { title = "Picture[- ]in[- ][Pp]icture" },
  keep_aspect_ratio = true,
})

hl.window_rule({
  match = { title = "Picture[- ]in[- ][Pp]icture" },
  move = "73% 72%",
})

hl.window_rule({
  match = { title = "Picture[- ]in[- ][Pp]icture" },
  size = "25% 25%",
})

hl.window_rule({
  match = { title = "Picture[- ]in[- ][Pp]icture" },
  float = true,
})

hl.window_rule({
  match = { title = "Picture[- ]in[- ][Pp]icture" },
  pin = true,
})

hl.window_rule({
  match = { class = "hyprpolkitagent" },
  float = true,
})

hl.window_rule({
  match = { class = "hyprpolkitagent" },
  size = "35% 35%",
})

hl.window_rule({
  match = { class = "hyprpolkitagent" },
  center = true,
})

hl.window_rule({
  match = { title = "Media viewer" },
  float = true,
})

hl.window_rule({
  match = { title = "Media viewer" },
  size = "45% 55%",
})

hl.window_rule({
  match = { title = "Media viewer" },
  center = true,
})

hl.window_rule({
  match = { title = "Volume Control" },
  float = true,
})

hl.window_rule({
  match = { title = "Volume Control" },
  size = "35% 45%",
})

hl.window_rule({
  match = { title = "Volume Control" },
  center = true,
})

hl.window_rule({
  match = { title = "Picture-in-Picture" },
  float = true,
})

hl.window_rule({
  match = { class = "Viewnior" },
  float = true,
})

hl.window_rule({
  match = { class = "Viewnior" },
  size = "50% 60%",
})

hl.window_rule({
  match = { class = "Viewnior" },
  center = true,
})

hl.window_rule({
  match = { title = "DevTools" },
  float = true,
})

hl.window_rule({
  match = { title = "DevTools" },
  size = "45% 50%",
})

hl.window_rule({
  match = { title = "DevTools" },
  center = true,
})

hl.window_rule({
  match = { class = "file_progress" },
  float = true,
})

hl.window_rule({
  match = { class = "confirm" },
  float = true,
})

hl.window_rule({
  match = { class = "dialog" },
  float = true,
})

hl.window_rule({
  match = { class = "download" },
  float = true,
})

hl.window_rule({
  match = { class = "notification" },
  float = true,
})

hl.window_rule({
  match = { class = "error" },
  float = true,
})

hl.window_rule({
  match = { class = "confirmreset" },
  float = true,
})

hl.window_rule({
  match = { title = "Open File" },
  float = true,
})

hl.window_rule({
  match = { title = "branchdialog" },
  float = true,
})

hl.window_rule({
  match = { title = "Confirm to replace files" },
  float = true,
})

hl.window_rule({
  match = { title = "File Operation Progress" },
  float = true,
})

-- Layer rules for panels and overlays
hl.layer_rule({
  match = { namespace = "waybar" },
  no_anim = true,
})

hl.layer_rule({
  match = { namespace = "waybar" },
  blur = true,
})

hl.layer_rule({
  match = { namespace = "waybar" },
  ignore_alpha = 0,
})
