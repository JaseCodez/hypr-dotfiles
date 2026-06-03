-- input
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border = {
                colors = {
                    "rgb(cdd6f4)",
                },
            },
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
    },
    misc = {
        disable_hyprland_logo = true,
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 7,
            passes = 3,
        },
    },
    dwindle = {
        preserve_split = true,
    },
    animations = {
        enabled = true,
    },
})

-- animations
hl.curve("myBezier", {
    type = "bezier",
    points = { {0.05, 0.9}, {0.1, 1.05}},
})

hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "default" })
