return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"scss",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"c",
				"rust",
				"vue",
				"prisma",
				"sql",
				"dart",
                "arduino",
                "http",
                "graphql",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = "<C-space>",
					-- node_incremental = "<C-space>",
					-- scope_incremental = false,
					-- node_decremental = "<bs>",
					init_selection = false,
					node_incremental = false,
					scope_incremental = false,
					node_decremental = false,
				},
			},
			-- rainbow = {
			-- 	enable = true,
			-- 	extended_mode = false,
			-- 	max_file_lines = nil,
			-- },
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
		})
	end,
}
