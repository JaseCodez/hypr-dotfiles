return {
    "catpuccin/nvim", 
    name = "catppuccin",
    priority = 1000, 
    config = function()
        vim.cmd.colorscheme "catppuccin"
        vim.cmd("hi Normal guibg=NONE ctermbg=NONE ")
    end
}

