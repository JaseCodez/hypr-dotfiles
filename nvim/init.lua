-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)


-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"

require "polish"

vim.cmd("colorscheme sorbet")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE ")

-- In your init.lua or relevant config file:

-- Ensure Neo-tree setup with the Sorbet theme
require("neo-tree").setup({
  -- Set Neo-tree to use the Sorbet theme
  window = {
    position = "left",  -- Customize position if needed
    width = 40,         -- Adjust window width if desired
    theme = "sorbet",   -- Set the Neo-tree theme to "sorbet"
  },
  -- Other Neo-tree settings...
})

-- Apply the highlight and theme change after opening Neo-tree
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",  -- Applies to all buffers
  callback = function()
    -- Check if the current buffer is a Neo-tree buffer
    if vim.bo.filetype == "neo-tree" then
      -- Set Neo-tree to use the sorbet theme
      vim.cmd("colorscheme sorbet")
      
      -- Set Normal highlight to transparent background
      vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    end
  end,
})




