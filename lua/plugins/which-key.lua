return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts.setup)
        wk.add({
            { "<Esc>", ":noh<CR>",    hidden = true },
            { "<C-s>", "<Esc>:w<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Save" },
            { "<C-q>", "<Esc>:q<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Close" },
            -- { "<C-a>", "ggVG", hidden = true, desc = "Select all" },
            { "<Esc>", "<C-\\><C-n>", mode = "t", hidden = true, desc = "Quit terminal emulator" },

            { "<C-;>",
                function()
                    require("scripts/language").toggle_language_n()
                end,
                mode = { "n" },
                hidden = true,
                desc = "Toggle language"
            },
            { "<C-;>",
                function()
                    require("scripts/language").toggle_language_i()
                end,
                mode = { "i" },
                hidden = true,
                desc = "Toggle language"
            },
            { "<C-;>",
                function()
                    require("scripts/language").toggle_language_c()
                end,
                mode = { "c" },
                hidden = true,
                desc = "Toggle language"
            },

            {
                "<C-\\>",
                "<C-\\><C-n>:ToggleTerm<CR>",
                mode = "t",
                hidden = true,
                desc = "Terminal Close",
            },
            {
                "<C-\\>",
                ":ToggleTerm<CR>",
                hidden = true,
                desc = "Terminal Toggle",
            },
            {
                "<C-l>",
                function()
                    require("luasnip").jump(1)
                end,
                mode = { "i" },
                hidden = true,
                desc = "Luasnip Jump Next",
            },
            {
                "<C-j>",
                function()
                    require("luasnip").jump(-1)
                end,
                mode = { "i" },
                hidden = true,
                desc = "Luasnip Jump Prev",
            },

            { "<leader><leader>", ":Telescope find_files<CR>",            desc = "Find File",           hidden = true },
            { "<leader>/",        ":Telescope live_grep<CR>",             desc = "Find Text",           hidden = true },
            { "<leader>q",        ":CloseBuffer<CR>",                     desc = "Close Buffer",        hidden = true },
            { "<leader>e",        ":Neotree toggle<CR>",                  desc = "Toggle tree",         hidden = true },

            { "<leader>f",        group = "Find" },
            { "<leader>ff",       ":SmartFind<CR>",                       desc = "Find" },
            { "<leader>fb",       ":Telescope buffers<CR>",               desc = "Find Buffer" },
            { "<leader>fh",       ":Telescope help_tags<CR>",             desc = "Find Help" },
            { "<leader>fc",       ":Telescope git_commits<CR>",           desc = "Find Commit" },
            { "<leader>fp",       ":Telescope projects<CR>",              desc = "Find Projects" },

            { "<leader>g",        group = "Git" },
            { "<leader>gr",       ":LazyGit<CR>3++]<CR>",                 desc = "Open Remote Branches" },
            { "<leader>gc",       ":LazyGit<CR>4+",                       desc = "Open Commits" },
            { "<leader>gg",       ":LazyGit<CR>2",                        desc = "Open Git" },
            { "<leader>gs",       ":Telescope git_status<CR>",            desc = "Open Status" },
            { "<leader>gb",       ":LazyBlame<CR>",                       desc = "Open Blame" },

            { "<leader>b",        group = "Buffer" },
            { "<leader>bd",       ":CloseBuffer<CR>",                     desc = "Close Buffer" },
            { "L",                ":BufferLineCycleNext<CR>",             hidden = true },
            { "H",                ":BufferLineCyclePrev<CR>",             hidden = true },

            { "<leader>c",        group = "Code" },
            { "<leader>cd",       vim.lsp.buf.definition,                 desc = "Code Definition" },
            { "<leader>cD",       vim.lsp.buf.declaration,                desc = "Code Declaration" },
            { "<leader>ca",       vim.lsp.buf.code_action,                desc = "Code Action" },
            -- { "<leader>cr",       vim.lsp.buf.rename,                     desc = "Code Rename" },
            { "<leader>cf",       vim.lsp.buf.format,                     desc = "Code Format" },
            { "<leader>ch",       vim.lsp.buf.hover,                      desc = "Code Hover" },
            { "<leader>cr",       vim.lsp.buf.references,                 desc = "Code References" },

            { "<leader>m",        group = "Move" },
            { "<leader>md",       vim.lsp.buf.definition,                 desc = "Move To Definition" },
            { "<leader>mD",       vim.lsp.buf.declaration,                desc = "Move To Declaration" },
            { "<leader>mr",       vim.lsp.buf.references,                 desc = "Move To References" },

            { "gd",               vim.lsp.buf.definition,                 desc = "Definition" },
            { "gD",               vim.lsp.buf.declaration,                desc = "Declaration" },
            { "gr",               vim.lsp.buf.references,                 desc = "References" },

            { "<leader>v",        group = "Vue" },
            { "<leader>vm",       "/^\\s*methods:\\s*{<CR>:noh<CR>zz",    desc = "Vue Methods" },
            { "<leader>vc",       "/^\\s*computed:\\s*{<CR>:noh<CR>zz",   desc = "Vue Computed" },
            { "<leader>vv",       "/^\\s*components:\\s*{<CR>:noh<CR>zz", desc = "Vue Components" },
            { "<leader>vw",       "/^\\s*watch:\\s*{<CR>:noh<CR>zz",      desc = "Vue Watch" },
            { "<leader>vp",       "/^\\s*props:\\s*{<CR>:noh<CR>zz",      desc = "Vue Props" },
            { "<leader>vd",       "/^\\s*data\\s*()\\s*{<CR>:noh<CR>zz",  desc = "Vue Data" },
            {
                "<leader>vb",
                "/^\\s*\\(async\\)\\?\\s*beforeDestroy\\s*()\\s*{<CR>:noh<CR>zz",
                desc = "Vue Before Destroy",
            },
            { "<leader>vM", "/^\\s*\\(async\\)\\?\\s*mounted\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Mounted" },
            { "<leader>vC", "/^\\s*\\(async\\)\\?\\s*created\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Created" },
            { "<leader>vU", "/^\\s*\\(async\\)\\?\\s*updated\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Updated" },
            { "<leader>vs", "/^\\s*<script<CR>:noh<CR>zz",                              desc = "Vue Script" },
            { "<leader>vS", "/^\\s*<style<CR>:noh<CR>zz",                               desc = "Vue Style" },
            { "<leader>vt", "G/^\\s*<template<CR>:noh<CR>zz",                           desc = "Vue Template" },

            { "<leader>t",  group = "Terminal" },
            {
                "<leader>tt",
                ":1ToggleTerm name='Master'<CR>",
                desc = "Terminal Master",
            },
            { "<leader>tf", group = "Terminal Frontend" },
            {
                "<leader>tff",
                ":2ToggleTerm name='Frontend'<CR>",
                desc = "Terminal Frontendl Open",
            },
            {
                "<leader>tfr",
                ":T RestartFrontend<CR>",
                desc = "Terminal Frontend Restart",
            },
            {
                "<leader>tfs",
                ":T StartFrontend<CR>",
                desc = "Terminal Frontend Start",
            },
            {
                "<leader>tfS",
                ":T StopFrontend<CR>",
                desc = "Terminal Frontend Stop",
            },
            { "<leader>tb", group = "Terminal Backend" },
            {
                "<leader>tbb",
                ":3ToggleTerm name='Backend'<CR>",
                desc = "Terminal Backend Open",
            },
            {
                "<leader>tbr",
                ":T RestartBackend<CR>",
                desc = "Terminal Backend Restart",
            },
            {
                "<leader>tbs",
                ":T StartBackend<CR>",
                desc = "Terminal Backend Start",
            },
            {
                "<leader>tbS",
                ":T StopBackend<CR>",
                desc = "Terminal Backend Stop",
            },
            {
                "<leader>t1",
                ":4ToggleTerm name='Terminal 1'<CR>",
                desc = "Terminal 1",
            },
            {
                "<leader>t2",
                ":5ToggleTerm name='Terminal 2'<CR>",
                desc = "Terminal 2",
            },
            {
                "<leader>t3",
                ":6ToggleTerm name='Terminal 3'<CR>",
                desc = "Terminal 3",
            },
            { "<leader>tp", group = "Terminal Project" },
            {
                "<leader>tpp",
                ":T StartProject<CR>",
                desc = "Terminal Project Start",
            },
            {
                "<leader>tpi",
                ":T InstallPackages <CR>",
                desc = "Terminal Project Install Packages",
            },

            { "<leader>s", group = "Spell" },
            {
                "<leader>ss",
                ":set spell!<CR>",
                desc = "Toggle Spell",
            },
        })
    end,
}
