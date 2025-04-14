return {
    "echasnovski/mini.icons",
    opts = {
        default = {
            directory = { glyph = '' },
        },
        file = {
            ['README.md'] = { glyph = '󰊄', hl = 'MiniIconsYellow'  },
            -- ['point.js'] = { glyph = '', hl = 'MiniIconsYellow'  },
            ['.env'] = { glyph = '*', hl = 'MiniIconsYellow'  },
        },
        extension = {
            dart = { glyph = '󰅲', hl = 'MiniIconsAzure'  },
            js = { glyph = '󰅲', hl = 'MiniIconsAzure'  },
            ts = { glyph = '󰅲', hl = 'MiniIconsAzure'  },
            jsx = { glyph = '󰅲', hl = 'MiniIconsAzure'  },
            tsx = { glyph = '󰅲', hl = 'MiniIconsAzure'  },

            log = { glyph = '󰊄', hl = 'MiniIconsYellow'  },
            json = { glyph = '', hl = 'MiniIconsYellow'  },
            html = { glyph = '', hl = 'MiniIconsYellow'  },
            xml = { glyph = '', hl = 'MiniIconsOrange'  },

            css = { glyph = '󰃐', hl = 'MiniIconsYellow'  },
            scss = { glyph = '󰃐', hl = 'MiniIconsYellow'  },
        },
        directory = {
            lib = { glyph = '', hl = 'MiniIconsBlue' },
            build = { glyph = '', hl = 'MiniIconsBlue' },
            node_modules = { glyph = '', hl = 'MiniIconsBlue' },
            src = { glyph = '', hl = 'MiniIconsBlue' },
            tests = { glyph = '', hl = 'MiniIconsBlue' },
            lua = { glyph = '', hl = 'MiniIconsBlue' },
            spell = { glyph = '', hl = 'MiniIconsBlue' },
            test = { glyph = '', hl = 'MiniIconsBlue' },
            queries = { glyph = '', hl = 'MiniIconsBlue' },
        },
    },
    lazy = true,
    specs = {
        { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
        package.preload["nvim-web-devicons"] = function()
            require("mini.icons").mock_nvim_web_devicons()
            return package.loaded["nvim-web-devicons"]
        end
    end,
}
