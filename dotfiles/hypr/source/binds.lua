local browser = "zen"

-- Widgets and System
hl.bind("SUPER + O", hl.dsp.exec_cmd("waylandar-dashboard"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exit())

-- Applications
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- kitty -1 -e yazi"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("uwsm app -- " .. browser))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("uwsm app -- " .. browser .. " --private-window"))
hl.bind("SUPER + CTRL + RETURN", hl.dsp.exec_cmd("uwsm app -- kitty -e tmux"))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty -1"))
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("kitty --class kitty-floating -1"))

-- Window Operations
hl.bind("SUPER + SPACE", hl.dsp.window.float())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Arrow Keys: Focus and Move
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "d" }))

hl.bind("SUPER + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))

-- Arrow Keys: Move Active Window
hl.bind("SUPER + ALT + Left", hl.dsp.window.move({ x = -50, y = 0, relative = true }))
hl.bind("SUPER + ALT + Right", hl.dsp.window.move({ x = 50, y = 0, relative = true }))
hl.bind("SUPER + ALT + Up", hl.dsp.window.move({ x = 0, y = -50, relative = true }))
hl.bind("SUPER + ALT + Down", hl.dsp.window.move({ x = 0, y = 50, relative = true }))

hl.bind("SUPER + SHIFT + ALT + Left", hl.dsp.window.move({ x = -4, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + ALT + Right", hl.dsp.window.move({ x = 4, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + ALT + Up", hl.dsp.window.move({ x = 0, y = -4, relative = true }))
hl.bind("SUPER + SHIFT + ALT + Down", hl.dsp.window.move({ x = 0, y = 4, relative = true }))

-- Vim Keys: Focus and Move
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Vim Keys: Move and Resize Active Window
hl.bind("SUPER + CONTROL + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind("SUPER + CONTROL + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind("SUPER + CONTROL + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind("SUPER + CONTROL + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

hl.bind("SUPER + ALT + H", hl.dsp.window.move({ x = -50, y = 0, relative = true }))
hl.bind("SUPER + ALT + L", hl.dsp.window.move({ x = 50, y = 0, relative = true }))
hl.bind("SUPER + ALT + K", hl.dsp.window.move({ x = 0, y = -50, relative = true }))
hl.bind("SUPER + ALT + J", hl.dsp.window.move({ x = 0, y = 50, relative = true }))

hl.bind("SUPER + SHIFT + ALT + H", hl.dsp.window.move({ x = -10, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + ALT + L", hl.dsp.window.move({ x = 10, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + ALT + K", hl.dsp.window.move({ x = 0, y = -10, relative = true }))
hl.bind("SUPER + SHIFT + ALT + J", hl.dsp.window.move({ x = 0, y = 10, relative = true }))

-- Workspaces Focus and Window Movement
for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Workspace Navigation
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + SHIFT + Z", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + X", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + Z", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + X", hl.dsp.focus({ workspace = "+1" }))

-- Mouse Window Dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
