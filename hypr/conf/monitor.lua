hl.monitor({
  output = "eDP-1",
  mode = "preferred",
  position = "auto",
  scale = "1.333333",
})

hl.monitor({
  output = "DP-1",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

hl.monitor({
  output = "DP-2",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

hl.monitor({
  output = "DP-3",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

hl.monitor({
  output = "DP-4",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

hl.monitor({
  output = "DP-5",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

hl.monitor({
  output = "DP-6",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor \"eDP-1, disable\""))
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor \"eDP-1, preferred, auto, 1.333333\""))
