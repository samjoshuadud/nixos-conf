hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- For normal uses:
-- hl.monitor({
--     output   = "",
--     mode     = "1920x1080",
--     position = "auto",
--     scale    = 1,
--     mirror   = "eDP-1",
-- })


-- Second monitor RULES
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@100",
    position = "auto",
    scale    = 1,
})

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1", default = true, persistent = true })



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
