# Dotfiles

Personal configuration files for Hyprland Wayland desktop (NixOS + portable).

## Structure

```
.dotfiles/
├── hypr/           # Hyprland window manager (Lua config)
├── kitty/          # Kitty terminal
├── tmux/           # tmux terminal multiplexer
├── mako/           # Mako notification daemon
├── waybar/         # Status bar
├── wofi/           # Application launcher
├── wlogout/        # Power menu
├── zathura/        # PDF viewer
├── btop/           # System monitor
├── starship.toml   # Shell prompt
├── wezterm/        # WezTerm terminal (alternative)
├── scripts/        # Utility scripts
├── prompts/        # AI prompt templates
├── voxtype/        # Voice-to-text config
├── cliamp/         # CLI audio player
├── gtk-3.0/        # GTK3 theming
├── gtk-4.0/        # GTK4 theming
├── .gitconfig      # Git configuration
└── README.md       # This file
```

## Deployment

### NixOS (with Home Manager)

Configs are automatically symlinked via Home Manager modules in `~/nixos-config`.

```bash
sudo nixos-rebuild switch --flake ~/nixos-config
```

### Non-NixOS (manual symlinks)

Create symlinks from `~/.config/` to the config directories:

```bash
# Kitty
ln -sf ~/.dotfiles/kitty ~/.config/kitty

# tmux
ln -sf ~/.dotfiles/tmux ~/.config/tmux

# Mako
ln -sf ~/.dotfiles/mako ~/.config/mako

# Git
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig

# Starship
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml

# Waybar
ln -sf ~/.dotfiles/waybar ~/.config/waybar

# Wofi
ln -sf ~/.dotfiles/wofi ~/.config/wofi

# Wlogout
ln -sf ~/.dotfiles/wlogout ~/.config/wlogout

# Zathura
ln -sf ~/.dotfiles/zathura ~/.config/zathura

# Btop
ln -sf ~/.dotfiles/btop ~/.config/btop

# GTK
ln -sf ~/.dotfiles/gtk-3.0 ~/.config/gtk-3.0
ln -sf ~/.dotfiles/gtk-4.0 ~/.config/gtk-4.0
```

## GPG Commit Signing

To enable GPG signing for commits:

1. Generate a GPG key (if you don't have one):
   ```bash
   gpg --full-generate-key
   ```

2. List your keys and get the key ID:
   ```bash
   gpg --list-secret-keys --keyid-format=long
   ```

3. Add to your git config:
   ```bash
   git config --global commit.gpgsign true
   git config --global user.signingkey YOUR_KEY_ID_HERE
   ```

4. Export your public key and add it to GitHub:
   ```bash
   gpg --armor --export YOUR_KEY_ID_HERE
   ```

## Applications

- **Window Manager**: Hyprland (Wayland)
- **Terminal**: Kitty (primary), WezTerm (alternative)
- **Shell**: Zsh + Starship prompt
- **Editor**: Neovim
- **Launcher**: Wofi
- **Notifications**: Mako
- **Status Bar**: Waybar
- **Lock Screen**: Hyprlock
- **PDF Viewer**: Zathura
- **System Monitor**: Btop

## Theme

Catppuccin Mocha color scheme across all applications.
