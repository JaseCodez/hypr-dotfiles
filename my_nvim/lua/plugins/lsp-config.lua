return {
    { 
        "mason-org/mason.nvim",
        config = function() 
            require("mason").setup()
        end 
    }, 
    {
        "mason-org/mason-lspconfig.nvim",
        config = function() 
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "bashls", "cmake", "dockerls", "ts_ls" }
            })
        end 
    },
    {
        "neovim/nvim-lspconfig",
        config = function() 
            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({})
            lspconfig.lua_ls.setup({})
            vim.keymap.set('n', 'L', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
