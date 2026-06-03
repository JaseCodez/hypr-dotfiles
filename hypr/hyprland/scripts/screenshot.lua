local home = os.getenv("HOME")
local screenshotDir = home .. "/Pictures/Screenshots/"

return function()
    local dateTime = os.date("%d-%m-%Y-%H-%M-%S")
    local imageName = screenshotDir .. dateTime .. ".png"

    hl.dispatch(hl.dsp.exec_cmd(string.format([[
        grim -g "$(slurp)" "%s" && \
        wl-copy -t image/png < "%s" && \
        notify-send -i "%s" "Grim" "Screenshot saved to clip and disk"
    ]], imageName, imageName, imageName)))
end
