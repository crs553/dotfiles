-- Built-in laptop display
hl.monitor({
  output = "eDP-1",
  mode = "preferred",
  position = "auto",
  scale = "1.333333",
})

-- External monitors (update descriptions to match physical ports)
hl.monitor({ output = "DP-1", mode = "preferred", position = "auto", scale = "1" }) -- e.g. Left
hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = "1" }) -- e.g. Center
hl.monitor({ output = "DP-3", mode = "preferred", position = "auto", scale = "1" })
hl.monitor({ output = "DP-4", mode = "preferred", position = "auto", scale = "1" })
hl.monitor({ output = "DP-5", mode = "preferred", position = "auto", scale = "1" })
hl.monitor({ output = "DP-6", mode = "preferred", position = "auto", scale = "1" })

