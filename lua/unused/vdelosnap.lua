return {
    "smenikdov/vdelosnap",
    build = "make build_generator",
    keys = {
        { "<leader>;;", "<Esc><cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>;j", "<Esc><cmd>CodeSnap js<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>;h", "<Esc><cmd>CodeSnap html<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>;s", "<Esc><cmd>CodeSnap scss<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },

        -- { "<leader>;s", "<Esc><cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
        -- { "<leader>;a", "<Esc><cmd>CodeSnapASCII<cr>", mode = "x", desc = "Save selected code snapshot in ASCII format" },
    },
    opts = {},
}
