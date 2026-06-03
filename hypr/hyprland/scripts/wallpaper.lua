local home = os.getenv("HOME")
return function()
    hl.dispatch(hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/wallpaper_selector.sh"))
end
