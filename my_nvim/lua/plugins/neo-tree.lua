return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function() 
        vim.keymap.set('n', '<leader>e', ':Neotree filesystem toggle left<CR>', {})
        
        vim.keymap.set("n", "<leader>o", function()
          local manager = require("neo-tree.sources.manager")
          local state = manager.get_state("filesystem")

          if state and state.winid and vim.api.nvim_win_is_valid(state.winid) then
            if vim.api.nvim_get_current_win() == state.winid then
              -- If Neo-tree is focused, go back to previous window
              vim.cmd("wincmd p")
            else
              -- If Neo-tree is open but not focused, focus it
              vim.api.nvim_set_current_win(state.winid)
            end
          else
            -- If Neo-tree is closed, open and reveal current file
            vim.cmd("Neotree reveal toggle")
          end
        end, { desc = "Toggle Neo-tree like AstroNvim" })
    end 
    
}
