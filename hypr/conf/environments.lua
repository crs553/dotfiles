hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-sky-cursors")
hl.env("GTK_THEME", "catppuccin-mocha-mauve-standard")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GDK_SCALE", "1")
hl.env("GDK_DPI_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1.5")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("CLUTTER_SCALE", "1.5")

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})
