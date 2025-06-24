return {
    'nvim-pack/nvim-spectre',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        color_devicons = false,
        open_cmd = 'vnew', -- can also be a lua function
        live_update = false, -- auto execute search again when you write to any file in vim
        lnum_for_results = true, -- show line number for search/replace results
        line_sep_start = '┌-----------------------------------------',
        result_padding = '¦  ',
        line_sep       = '└-----------------------------------------',
        highlight = {
            ui = "String",
            search = "DiffChange",
            replace = "DiffDelete"
        },
    },
}
