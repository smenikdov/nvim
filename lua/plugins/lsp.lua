-- lcpconfig https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- volar install instruction https://github.com/vuejs/language-tools
-- mason lspconfig https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#default-configuration

return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "eslint",
                "lua_ls",
                "cssls",
                "html",
                "ts_ls",
                "volar",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.cssls.setup({})
            lspconfig.html.setup({})
            lspconfig.eslint.setup({})
            lspconfig.volar.setup({
                filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
                init_options = {
                    vue = {
                      hybridMode = false,
                    },
                },
            })
        end,
    },
}
