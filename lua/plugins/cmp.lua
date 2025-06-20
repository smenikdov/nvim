return {
	"hrsh7th/nvim-cmp",
	dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        -- "dmitmel/cmp-digraphs"
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
        require("snippets.lua-like.init")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- ["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(), -- or close()
				["<CR>"] = cmp.mapping.confirm({
					-- behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{
                    name = "buffer",
                    option = {
                        -- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%([\-.]\w*\)*\)]]
                        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|[a-zA-Zа-яА-ЯёЁ_][a-zA-Zа-яА-ЯёЁ\d_]*\%([\-][a-zA-Zа-яА-ЯёЁ\d_]*\)*\)]]
                    },
                },
				{ name = "path" },
			}),
		});

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
				{
                    name = "buffer",
                    option = {
                        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|[a-zA-Zа-яА-ЯёЁ_][a-zA-Zа-яА-ЯёЁ\d_]*\%([\-][a-zA-Zа-яА-ЯёЁ\d_]*\)*\)]]
                    },
                },
            }
        });

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    { name = 'path' }
                },
                {
                    { name = 'cmdline' }
                }
            ),
            matching = { disallow_symbol_nonprefix_matching = false }
        });

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require('lspconfig')
        local servers = { 'lua_ls', 'cssls', 'ts_ls' }
        for _, server in ipairs(servers) do
            lspconfig[server].setup {
                capabilities = capabilities,
            }
        end
    end,
}
