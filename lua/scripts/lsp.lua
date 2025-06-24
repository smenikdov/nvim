require("mason").setup()


require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "jsonls",
        "eslint",
        "ts_ls",
        "sqls",
    },
    -- automatic_enable = false,
}


local lspconfig = require("lspconfig")

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,
})

lspconfig.lua_ls.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.ts_ls.setup({})
-- lspconfig.eslint.setup({})
lspconfig.sqls.setup({
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end,
    settings = {
        sqls = {
            connections = {
                -- LOCAL
                {
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=FCp9N4faxDQvjL59 dbname=vdelo sslmode=disable',
                },
                -- DEV
                {
                    driver = 'postgresql',
                    dataSourceName = 'host=81.177.140.128 port=5432 user=ruslan password=FCp9N4faxDQvjL59 dbname=vdelo sslmode=disable',
                },
                -- LOCAL VDELO BEN
                {
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=FCp9N4faxDQvjL59 dbname=vdelo-ben sslmode=disable',
                },
                -- TYUEMN
                {
                    driver = 'postgresql',
                    dataSourceName = 'host=192.168.1.148 port=5434 user=ruslan password=FCp9N4faxDQvjL59 dbname=vdelo sslmode=disable',
                },
                -- INVESTRA
                {
                    driver = 'postgresql',
                    dataSourceName = 'host=81.177.141.43 port=5432 user=investra password=RQ8RB7Xxt1DyS dbname=investra sslmode=disable',
                },
            },
        },
    },
})
