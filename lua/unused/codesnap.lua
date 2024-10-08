return {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
        { "<leader>;;", "<Esc><cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>;s", "<Esc><cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
        { "<leader>;a", "<Esc><cmd>CodeSnapASCII<cr>", mode = "x", desc = "Save selected code snapshot in ASCII format" },
    },
    opts = {
        mac_window_bar = false,
        save_path = "~/Pictures",
        has_breadcrumbs = true,
        bg_theme = "grape",
        show_workspace = false,
        breadcrumbs_separator = "/",
        has_line_number = true,
        bg_x_padding = 122,
        bg_y_padding = 82,
        bg_padding = nil,
        -- min_width = 0,
        watermark = "VDELO.DEV",
        watermark_font_family = "JetBrains Mono",
        code_font_family = "JetBrains Mono",
        title = "VDELO.DEV",
    },
}
