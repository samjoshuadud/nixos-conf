hl.window_rule({
    match = { class = "^(org.gnome.Calculator)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    move = "1492 839",
    size = "427 240",
    pin = true,
})

hl.window_rule({
    match = { class = "^(kitty-floating)$" },
    float = true,
})

hl.window_rule({
    match = { fullscreen = true },
    idle_inhibit = "always",
})
