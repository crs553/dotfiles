# Minimal Catppuccin Mocha Waybar

Three floating islands: workspaces / clock, and one status pill. Hardware-only
modules disappear on their own, so the same config runs on the Framework laptop
and the workstation.

## What adapts per machine

- Battery module hides when the machine has no battery.
- Backlight module hides when `/sys/class/backlight` has no device.
- Temperature prefers `coretemp` (Intel), `k10temp`/`zenpower` (AMD), or
  `x86_pkg_temp` instead of the bogus `thermal_zone0`.
- GPU utilisation/temperature appears in the vitals tooltip only when
  `nvidia-smi` exists (workstation).
- Network handles both Wi-Fi and Ethernet.
