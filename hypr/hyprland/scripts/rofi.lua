local home = os.getenv("HOME")
local rofi_dir = home .. "/.config/rofi/"

return function()
    hl.dispatch(hl.dsp.exec_cmd("magick " .. rofi_dir .. "bay.JPG -resize 300x200 " .. rofi_dir .. "bay.JPG"))
    
    hl.dispatch(hl.dsp.exec_cmd("rofi -show drun -theme " .. rofi_dir .. "config.rasi"))
end
