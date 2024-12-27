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
            -- lspconfig.eslint.setup({})
            lspconfig.ts_ls.setup({
                -- HYBRID_MODE:
                -- init_options = {
                --     plugins = {
                --         {
                --             name = '@vue/typescript-plugin',
                --             location = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
                --             languages = { 'vue' },
                --         },
                --     },
                --   },
                --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            })
            -- lspconfig.volar.setup({
            --     -- UNHYBRID_MODE:
            --     filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
            --     init_options = {
            --         vue = {
            --           hybridMode = false,
            --         },
            --     },
            -- })
        end,
    },
}
