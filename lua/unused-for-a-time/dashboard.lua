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
    config = function()
        require("dashboard").setup({
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
        })

        -- local function open_dashboard_on_last_buffer()
        --     local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        --
        --     -- Если нет открытых буферов или остался только безымянный буфер
        --     if #buffers == 0 or (#buffers == 1 and buffers[1].name == "") then
        --         vim.cmd("Dashboard")
        --     end
        -- end
        --
        -- vim.api.nvim_create_autocmd("BufDelete", {
        --     callback = open_dashboard_on_last_buffer,
        -- })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
