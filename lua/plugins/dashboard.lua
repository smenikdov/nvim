local function default_header()
    return {
        '', '', '',
        ' █████████████  ████████████████████████████████████████ ',
        '██                                                     ██',
        '██                                                     ██',
        '                                                        ',
        '       ███████  ███████   ██████   █████   ███████      ',
        '       ██   ██  ██   ██   ██      ██   ██  ██   ██      ',
        '       ███████  ██   ██   █████   ██   ██  ██   ██      ',
        '       ██   ██  ██   ██   ██      ██   ██  ██   ██      ',
        '       ███████ █████████  ██████  ██   ██  ███████      ',
        '                                                        ',
        '██                                                     ██',
        '██                                                     ██',
        ' ████████████████████████████████████████  █████████████ ',
        '', '', ''
    }
end

return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
        theme = "doom",
        disable_move = true,
        shortcut_type = "number",
        config = {
            header = default_header(),
            disable_move = true,
            center = {
                {
                    icon = '󰊳 ',
                    desc = 'Lazy Update',
                    key = 'u',
                    action = 'Lazy update',
                },
                {
                    icon = ' ',
                    desc = 'Find File',
                    key = 'f',
                    action = 'Telescope find_files'
                },
                {
                    icon = ' ',
                    desc = 'Find Project',
                    key = 'p',
                    action = 'Telescope projects'
                },
            },
            footer = {
                "",
                "",
                "",
                "",
                "VDELO.DEV",
            },
        },
        hide = {
            statusline = true,
            tabline = true,
            winbar = true,
        },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
