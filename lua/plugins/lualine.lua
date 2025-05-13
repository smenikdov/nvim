return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = "catppuccin",
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {
                        'dashboard',
                        'Avante',
                        'AvanteSelectedFiles',
                        'AvanteSelectedFiles',
                    },
                    winbar = {
                        'dashboard',
                    },
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {
                    "mode",
                },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { {
                    "filename",
                    path = 1,
                    symbols = { unnamed = '' }
                } },
                lualine_x = {
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                        color = { fg = "#ff9e64" },
                    },
                    -- 'tabnine'
                    {
                        function()
                            return require("scripts.env-manager.init").active_state_name() or ""
                            -- return vim.api.nvim_call_function("codeium#GetStatusString", {})
                        end
                    },
                    "filetype",
                },
                lualine_y = { 
                     function()
                         return require("scripts.language").get_language()
                      end
                },
                lualine_z = { "progress" },
                -- lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {
                "neo-tree",
                "toggleterm",
                "mason",
                "lazy",
            },
        })
    end,
}
