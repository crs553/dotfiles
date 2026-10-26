#!/usr/bin/env python3
"""Compact Waybar vitals module: CPU, memory and temperature on the bar.

Disk, load, uptime and GPU details are shown in the tooltip. The GPU line only
appears on machines where nvidia-smi is available, so the same script is used
on the laptop and the workstation.
"""

import json
import os
import shutil
import subprocess
import time
from pathlib import Path

MAUVE = "#cba6f7"
CPU_ICON = ""
RAM_ICON = ""
TEMP_ICON = ""

HWMON_CPU = {"coretemp", "k10temp", "zenpower", "cpu_thermal", "soc_thermal"}
THERMAL_CPU = {"x86_pkg_temp", "cpu-thermal", "soc_thermal", "cpu_thermal"}


def read_int(path: Path) -> int | None:
    try:
        return int(path.read_text().strip())
    except (OSError, ValueError):
        return None


def cpu_percent(sample: float = 0.18) -> int:
    def snapshot() -> tuple[int, int]:
        fields = Path("/proc/stat").read_text().splitlines()[0].split()[1:]
        values = [int(v) for v in fields]
        idle = values[3] + (values[4] if len(values) > 4 else 0)
        return idle, sum(values)

    idle_a, total_a = snapshot()
    time.sleep(sample)
    idle_b, total_b = snapshot()
    delta = total_b - total_a
    if delta <= 0:
        return 0
    return round(100 * (1 - (idle_b - idle_a) / delta))


def memory() -> tuple[float, float, int]:
    info: dict[str, int] = {}
    for line in Path("/proc/meminfo").read_text().splitlines():
        key, value = line.split(":", 1)
        info[key] = int(value.split()[0])

    total = info["MemTotal"] / 1024**2
    used = total - info["MemAvailable"] / 1024**2
    percent = round(100 * used / total) if total else 0
    return used, total, percent


def cpu_model() -> str:
    try:
        for line in Path("/proc/cpuinfo").read_text().splitlines():
            if line.startswith("model name"):
                return line.split(":", 1)[1].strip()
    except OSError:
        pass
    return "CPU"


def temperature() -> float | None:
    for hwmon in sorted(Path("/sys/class/hwmon").glob("hwmon*")):
        name = (hwmon / "name").read_text().strip() if (hwmon / "name").exists() else ""
        if name not in HWMON_CPU:
            continue
        raw = read_int(hwmon / "temp1_input")
        if raw and 0 < raw < 120_000:
            return raw / 1000

    zones = sorted(Path("/sys/class/thermal").glob("thermal_zone*"))
    for zone in zones:
        kind = (zone / "type").read_text().strip() if (zone / "type").exists() else ""
        if kind in THERMAL_CPU:
            raw = read_int(zone / "temp")
            if raw and 0 < raw < 120_000:
                return raw / 1000

    # Last resort: warmest sane thermal zone. This avoids the INT3400 zone on
    # Framework laptops, which reports an almost constant 20°C.
    sane = []
    for zone in zones:
        raw = read_int(zone / "temp")
        if raw and 20_000 < raw < 120_000:
            sane.append(raw / 1000)
    return max(sane) if sane else None


def gpu() -> str | None:
    nvidia_smi = shutil.which("nvidia-smi")
    if not nvidia_smi:
        return None
    try:
        result = subprocess.run(
            [
                nvidia_smi,
                "--query-gpu=utilization.gpu,temperature.gpu",
                "--format=csv,noheader,nounits",
            ],
            capture_output=True,
            text=True,
            timeout=2,
            check=False,
        )
        first = result.stdout.strip().splitlines()[0]
        util, temp = (part.strip() for part in first.split(",")[:2])
        return f"{util}%  {temp}°C"
    except (OSError, IndexError, ValueError, subprocess.SubprocessError):
        return None


def uptime() -> str:
    try:
        seconds = int(float(Path("/proc/uptime").read_text().split()[0]))
    except (OSError, ValueError):
        return "—"
    days, rest = divmod(seconds, 86_400)
    hours = rest // 3_600
    return f"{days}d {hours}h" if days else f"{hours}h"


def main() -> None:
    cpu = cpu_percent()
    used, total, mem_percent = memory()
    temp = temperature()

    parts = [f"<span foreground='{MAUVE}'>{CPU_ICON}</span> {cpu}%"]
    parts.append(f"<span foreground='{MAUVE}'>{RAM_ICON}</span> {used:.1f}G")
    if temp is not None:
        parts.append(f"<span foreground='{MAUVE}'>{TEMP_ICON}</span> {temp:.0f}°")

    disk = shutil.disk_usage("/")
    disk_percent = round(100 * disk.used / disk.total) if disk.total else 0
    load = os.getloadavg()

    lines = [
        f"CPU    {cpu}%  ·  {cpu_model().replace('(R)', '').replace('(TM)', '').strip()}",
        f"Memory {used:.1f} / {total:.1f} GiB  ({mem_percent}%)",
    ]
    if temp is not None:
        lines.append(f"Temp   {temp:.0f}°C")
    lines += [
        f"Disk   {disk_percent}%  ·  {disk.used / 1024**3:.0f} / {disk.total / 1024**3:.0f} GiB",
        f"Load   {load[0]:.2f}  {load[1]:.2f}  {load[2]:.2f}",
        f"Uptime {uptime()}",
    ]
    gpu_line = gpu()
    if gpu_line:
        lines.append(f"GPU    {gpu_line}")

    css_class = "normal"
    if temp is not None:
        if temp >= 85:
            css_class = "critical"
        elif temp >= 75:
            css_class = "warning"

    print(
        json.dumps(
            {
                "text": "  ".join(parts),
                "tooltip": "<tt>" + "\n".join(lines) + "</tt>",
                "class": css_class,
            }
        )
    )


if __name__ == "__main__":
    main()
