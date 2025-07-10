---@type LazySpec
return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {},
    ---@type YaziConfig | {}
    opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = true,
        keymaps = {
            show_help = "<f1>",
            cycle_open_buffers = "gb",
        },
    },
}
