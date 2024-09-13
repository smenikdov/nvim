return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
        "saadparwaiz1/cmp_luasnip",
		-- "rafamadriz/friendly-snippets",
		-- "onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		-- local lspkind = require("lspkind")
		local luasnip = require("luasnip")

        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })
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
				-- { name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		});

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        });

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        -- cmp.setup.cmdline(':', {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = cmp.config.sources(
        --         {
        --             { name = 'path' }
        --         },
        --         {
        --             { name = 'cmdline' }
        --         }
        --     ),
        --     matching = { disallow_symbol_nonprefix_matching = false }
        -- });

        -- local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- require('lspconfig')['tsserver'].setup {
        --     capabilities = capabilities
        -- }
    end,
}
