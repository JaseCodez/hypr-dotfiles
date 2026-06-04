local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + D", hl.dsp.window.kill())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))


local launchRofi = require("hyprland.scripts.rofi")

hl.bind(mainMod .. " + SPACE", launchRofi)

local screenshot = require("hyprland.scripts.screenshot")
hl.bind("Print", screenshot)

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("hyprlock"))

-- Lock lid on close
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprlock &"))

-- utils 
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 +10%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 -10%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl -- set-sink-mute 0 toggle"))

local micScript = require("hyprland.scripts.mutemic")
hl.bind("XF86AudioMicMute", micScript)

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"))

local vimKeys = {
    ["H"] = "left",
    ["L"] = "right",
    ["K"] = "up",
    ["J"] = "down",
}

-- Move focus with mainMod + vim keys
for key, value in pairs(vimKeys) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = value }))
    hl.bind(mainMod .. " + SHIFT + " .. key, function()
        hl.dispatch(hl.dsp.window.move({ direction = value }))
    end)
end

-- Switch wallpaper
local wallpaper = require("hyprland.scripts.wallpaper")
hl.bind(mainMod .. " + P", wallpaper)

-- Switch workspace
for i = 1, 10 do 
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }) )
end

local waybar = require("hyprland.scripts.waybar")
hl.bind(mainMod .. " + SHIFT + S", waybar)

hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "r-1" }))


hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 10,  y = 0 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -10, y = 0 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",  hl.dsp.window.resize({ x = 0, y = -10 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 10 }), { repeating = true })
