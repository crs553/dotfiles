hl.config({
  dwindle = {
    preserve_split = true,
    default_split_ratio = 1,
    smart_split = false,
    smart_resizing = true,
  },
  cursor = {
    hide_on_key_press = true,
    warp_on_change_workspace = true,
  },
  binds = {
    hide_special_on_workspace_change = true,
  },
})

hl.gesture({
  fingers = 4,
  direction = "horizontal",
  action = "workspace",
})
