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
                "jsonls",
                "ts_ls",
                -- "volar",
                "sqls",
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
            lspconfig.jsonls.setup({})
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

            lspconfig.sqls.setup({
                on_attach = function(client, bufnr)
                    require('sqls').on_attach(client, bufnr)
                end,
                settings = {
                    sqls = {
                        connections = {
                            {
                                driver = 'postgresql',
                                dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=FCp9N4faxDQvjL59 dbname=vdelo sslmode=disable',
                            },
                            {
                                driver = 'postgresql',
                                dataSourceName = 'host=81.177.140.128 port=5432 user=ruslan password=FCp9N4faxDQvjL59 dbname=vdelo sslmode=disable',
                            },
                            {
                                driver = 'postgresql',
                                dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=FCp9N4faxDQvjL59 dbname=vdelo-ben sslmode=disable',
                            },
                            -- {
                            --     driver = 'postgresql',
                            --     dataSourceName = 'host=81.177.141.43 port=5432 user=investra password=RQ8RB7Xxt1DyS dbname=investra sslmode=disable',
                            -- },
                        },
                    },
                },
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
