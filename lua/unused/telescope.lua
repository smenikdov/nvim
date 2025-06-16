return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-live-grep-args.nvim',
            vestion = '^1.0.0',
        },
    },

    config = function()
        local telescope = require('telescope')
        local lga_actions = require('telescope-live-grep-args.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-l>'] = false,
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                }
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            -- ['<C-k>'] = lga_actions.quote_prompt(),
                            ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
                            ['<C-j>'] = lga_actions.quote_prompt({ postfix = ' --iglob *.js' }),
                            ['<C-v>'] = lga_actions.quote_prompt({ postfix = ' --iglob *.vue' }),
                            
                            -- ["<C-space>"] = lga_actions.to_fuzzy_refine,
                        },
                    },

                    -- theme = "dropdown", -- use dropdown theme
                    -- theme = { }, -- use own theme spec
                    -- layout_config = { mirror=true }, -- mirror preview pane
                }
            }
        })

        telescope.load_extension('live_grep_args')
    end
}
