local o = vim.o
o.number = true
o.relativenumber = true
o.tabstop = 4
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
o.wrap = true
o.clipboard = "unnamedplus"
o.swapfile = false
vim.cmd("hi Normal guibg=NONE ctermbg=NONE ")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
