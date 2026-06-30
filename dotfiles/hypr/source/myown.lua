hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
    },
    animations = {
        enabled = false,
    },
})

hl.curve("myBezier", { type = "bezier", points = { {0.4, 0.0}, {0.2, 1.0} } })

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "myBezier" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "myBezier" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "myBezier", style = "slidefade 20%" })
