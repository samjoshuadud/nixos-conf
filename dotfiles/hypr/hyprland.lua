hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

hl.monitor({
    output   = "",
    mode     = "1920x1080",
    position = "auto",
    scale    = 1,
    mirror   = "eDP-1",
})

require("source/environment")
require("source/binds")
require("source/autostart")
require("source/windowrules")
require("source/input")
require("source/appearance")
require("source/misc")

-- Ambxst
loadfile(os.getenv("HOME") .. "/.local/share/ambxst/hyprland.lua")()

-- Overrides
require("source/myown")
