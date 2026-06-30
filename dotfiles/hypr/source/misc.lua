hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        focus_on_activate = true,
        allow_session_lock_restore = true,
        middle_click_paste = false,
    },
    render = {
        direct_scanout = false,
    },
    dwindle = {
        preserve_split = true,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
