-- Helpers
local function float_at(class, size)
	local s = size or "35% 45%"
	hl.window_rule({ match = { class = class }, float = true })
	hl.window_rule({ match = { class = class }, size = s })
	hl.window_rule({ match = { class = class }, center = true })
end

local function float_title(title, size)
	local s = size or "35% 45%"
	hl.window_rule({ match = { title = title }, float = true })
	hl.window_rule({ match = { title = title }, size = s })
	hl.window_rule({ match = { title = title }, center = true })
end

local function window_to(class, workspace)
	hl.window_rule({ match = { class = class }, workspace = tostring(workspace) })
end

-- Event suppression
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ match = { class = "org\\.oe-f\\." }, suppress_event = "fullscreen" })

-- Workspace: terminal (1)
hl.window_rule({ match = { class = "kitty" }, workspace = "1" })
hl.window_rule({ match = { class = "terminator" }, workspace = "1" })

-- Workspace: browsers & dev tools (2-3)
hl.window_rule({ match = { class = "org\\.mozilla\\.firefox" }, workspace = "2" })
hl.window_rule({ match = { class = "firefox" }, workspace = "2" })
hl.window_rule({ match = { class = "brave-browser" }, workspace = "2" })
hl.window_rule({ match = { class = "Mullvad Browser" }, workspace = "2" })
hl.window_rule({ match = { class = "org\\.qutebrowser\\.qutebrowser" }, workspace = "2" })

hl.window_rule({ match = { class = "bruno" }, workspace = "3" })
hl.window_rule({ match = { class = "codium-url-handler" }, workspace = "3" })
hl.window_rule({ match = { class = "code" }, workspace = "3" })
hl.window_rule({ match = { class = "codium" }, workspace = "3" })

-- Workspace: file managers (4)
hl.window_rule({ match = { class = "org\\.gnome\\.Nautilus" }, workspace = "4" })
hl.window_rule({ match = { class = "org\\.kde\\.dolphin" }, workspace = "4" })
hl.window_rule({ match = { class = "nemo" }, workspace = "4" })
hl.window_rule({ match = { class = "yazi" }, workspace = "4" })
hl.window_rule({ match = { class = "thunar" }, workspace = "4" })

-- Workspace: communication (5)
local comms =
	{ "signal", "Signal", "org\\.signal\\.Signal", "discord", "Slack", "telegram-desktop", "Element", "ferdi" }
for _, cls in ipairs(comms) do
	hl.window_rule({ match = { class = cls }, workspace = "5" })
end

-- Workspace: productivity (6)
local productivity = { "obsidian", "@joplin/app-desktop", "ONLYOFFICE", "org\\.oe-f\\." }
for _, cls in ipairs(productivity) do
	hl.window_rule({ match = { class = cls }, workspace = "6" })
end

hl.window_rule({ match = { initial_title = "Excalidraw" }, workspace = "6" })
hl.window_rule({ match = { initial_title = "Vikunja" }, workspace = "6" })

-- Workspace: media (7)
hl.window_rule({ match = { class = "Spotify" }, workspace = "7" })
hl.window_rule({ match = { class = "vlc" }, workspace = "7" })
hl.window_rule({ match = { class = "mpv" }, workspace = "7" })
hl.window_rule({ match = { title = "Navidrome" }, workspace = "7" })

-- Workspace: utilities (8)
hl.window_rule({ match = { class = "localsend_app" }, workspace = "8" })

-- Floating: app dialogs (float + size + center)
float_at("blueman-manager")
float_at("\\.blueman-manager-wrapped")
float_at("org\\.pulseaudio\\.pavucontrol")
float_at("hyprpolkitagent", "35% 35%")
float_at("Viewnior", "50% 60%")

-- Floating: title-based dialogs (float + size + center)
float_title("Media viewer", "45% 55%")
float_title("Volume Control")
float_title("DevTools", "45% 50%")

-- Picture-in-Picture (regex)
hl.window_rule({ match = { title = "Picture[- ]in[- ][Pp]icture" }, keep_aspect_ratio = true })
hl.window_rule({ match = { title = "Picture[- ]in[- ][Pp]icture" }, move = "73% 72%" })
hl.window_rule({ match = { title = "Picture[- ]in[- ][Pp]icture" }, size = "25% 25%" })
hl.window_rule({ match = { title = "Picture[- ]in[- ][Pp]icture" }, float = true })
hl.window_rule({ match = { title = "Picture[- ]in[- ][Pp]icture" }, pin = true })

-- Picture-in-Picture (exact)
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true })

-- Floating: generic dialog classes (float only)
local dialog_classes = { "file_progress", "confirm", "dialog", "download", "notification", "error", "confirmreset" }
for _, cls in ipairs(dialog_classes) do
	hl.window_rule({ match = { class = cls }, float = true })
end

-- Floating: title-based (float only)
local float_titles = { "Open File", "branchdialog", "Confirm to replace files", "File Operation Progress" }
for _, t in ipairs(float_titles) do
	hl.window_rule({ match = { title = t }, float = true })
end

-- Layer rules
hl.layer_rule({ match = { namespace = "waybar" }, no_anim = true })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0 })
