# VoxType Setup

## First run (after rebuild)

1. Rebuild: `sudo nixos-rebuild switch --flake ~/nixos-config`
2. Start daemon: `systemctl --user start voxtype`

## Keybinding

- **SUPER + Shift + V** — toggle recording on/off

## Configuration

- Engine: Parakeet Unified EN 0.6B (ONNX-enabled binary)
- Streaming: enabled (text appears at cursor as you speak)
- Toggle mode required for streaming on Hyprland
- Model: parakeet-unified-en-0.6b (~2.5 GB, supports both offline and streaming)

## Troubleshooting

- Check daemon status: `systemctl --user status voxtype`
- View logs: `journalctl --user -xeu voxtype.service`
- Stop daemon: `systemctl --user stop voxtype`

## Notes

- The ONNX-enabled voxtype binary is built via a NixOS overlay in `flake.nix`
- Streaming requires the unified model (parakeet-unified-en-0.6b), not the batch-only TDT v3
- Model downloaded from bobNight/parakeet-unified-en-0.6b-onnx with symlinks for v0.7.2 naming
