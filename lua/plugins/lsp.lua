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
            ensure_installed = { "lua_ls", "tsserver", "volar", "vuels", "cssls", "html" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.cssls.setup({})
            lspconfig.html.setup({})
            lspconfig.lua_ls.setup({})

            if false then
                if false then
                    lspconfig.tsserver.setup({
                        init_options = {
                            plugins = {
                                {
                                    name = "@vue/typescript-plugin",
                                    -- location = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
                                    location =
                                    "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
                                    languages = { "vue" },
                                },
                            },
                        },
                        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                    })

                    lspconfig.volar.setup({
                        cmd = { "vue-language-server", "--stdio" },
                        filetypes = { "vue" },
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
                else
                    lspconfig.volar.setup({
                        cmd = { "vue-language-server", "--stdio" },
                        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                        init_options = {
                            typescript = {
                                tsdk =
                                "/home/stoic/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib",
                            },
                            vue = {
                                hybridMode = false,
                            },
                        },
                    })
                end
            else
                lspconfig.tsserver.setup({
                    init_options = {
                    },
                    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
                })
                -- lspconfig.vuels.setup({
                --     cmd = { "vls" },
                --     filetypes = { "vue" },
                --     init_options = {
                --         config = {
                --             css = {},
                --             emmet = {},
                --             html = {
                --                 suggest = {},
                --             },
                --             javascript = {
                --                 format = {},
                --             },
                --             stylusSupremacy = {},
                --             typescript = {
                --                 format = {},
                --             },
                --             vetur = {
                --                 completion = {
                --                     autoImport = false,
                --                     tagCasing = "kebab",
                --                     useScaffoldSnippets = false,
                --                 },
                --                 format = {
                --                     defaultFormatter = {
                --                         js = "none",
                --                         ts = "none",
                --                     },
                --                     defaultFormatterOptions = {},
                --                     scriptInitialIndent = false,
                --                     styleInitialIndent = false,
                --                 },
                --                 useWorkspaceDependencies = false,
                --                 validation = {
                --                     script = true,
                --                     style = true,
                --                     template = true,
                --                 },
                --             },
                --         },
                --     },
                    -- root-dir
                -- })
            end
        end,
    },
}
