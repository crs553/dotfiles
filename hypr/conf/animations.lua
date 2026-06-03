hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("emphasizedDecel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.curve("overshoot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "popin 85%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "quick", style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2.5, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2.5, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "slidevert 25%" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 2.5, bezier = "emphasizedDecel", style = "slidevert 25%" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2, bezier = "quick", style = "slidevert 25%" })
hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "emphasizedDecel" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2.5, bezier = "emphasizedDecel", style = "popin 90%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "quick", style = "popin 95%" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "easeOutQuint" })
