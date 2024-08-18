return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "tsserver", "volar", "cssls", "html" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({
                -- init_options = {
                -- 	plugins = {
                -- 		{
                -- 			name = "@vue/typescript-plugin",
                -- 			location = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
                -- 			languages = { "vue" },
                -- 		},
                -- 	},
                -- },
                -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })

            lspconfig.volar.setup({
                init_options = {
                    typescript = {
                        tsdk =
                        "/home/stoic/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib",
                    },
                    vue = {
                        hybridMode = true,
                    },
                },
            })
            lspconfig.cssls.setup({})
            lspconfig.html.setup({})
        end,
    },
}
