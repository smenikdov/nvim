return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    tag = "stable",
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
        local lang = require("scripts.language")


        -- <M is alt!!!!

        -- AI
        -- vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        -- vim.keymap.set('i', '<C-x>', function () return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        -- vim.keymap.set('i', '<C-]>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
        -- vim.keymap.set('i', '<C-[>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        -- vim.keymap.set('i', '<M-a>', function () return vim.fn['codeium#Complete'] end, { expr = true, silent = true })

        -- Snippets
        vim.keymap.set('i', '<C-l>', function () return require("luasnip").jump(1) end, { expr = true, silent = true })
        vim.keymap.set('i', '<C-j>', function () return require("luasnip").jump(-1) end, { expr = true, silent = true })

        -- Language
        vim.keymap.set('i', '<C-;>', function () return lang.toggle_language_i() end, { expr = true, silent = true })
        vim.keymap.set('n', '<C-;>', function () return lang.toggle_language_n() end, { expr = true, silent = true })
        vim.keymap.set('c', '<C-;>', function () return lang.toggle_language_c() end, { expr = true, silent = true })
        vim.keymap.set('v', '<C-;>', function ()  end, { expr = true, silent = true })

        wk.setup(opts.setup)
        wk.add({
            { "<Esc>", ":noh<CR>",    hidden = true },
            { "<C-s>", "<Esc>:w<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Save" },
            { "<C-q>", "<Esc>:q<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Close" },
            -- { "<C-a>", "ggVG", hidden = true, desc = "Select all" },
            { "<Esc>", "<C-\\><C-n>", mode = "t", hidden = true, desc = "Quit terminal emulator" },

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
            {
                "<leader>tf",
                ":2ToggleTerm name='Frontend'<CR>",
                desc = "Terminal Frontendl Open",
            },
            {
                "<leader>tb",
                ":3ToggleTerm name='Backend'<CR>",
                desc = "Terminal Backend Open",
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
            {
                "<leader>sg",
                "zg",
                desc = "Spell Good Mark",
            },
            {
                "<leader>sw",
                "zw",
                desc = "Spell Woops Mark",
            },
            {
                "<leader>sh",
                "[s",
                desc = "Spell Prev",
            },
            {
                "<leader>sl",
                "]s",
                desc = "Spell Next",
            },


            { "<leader>a", group = "AI" },
            {
                "<leader>aa",
                ":TabnineToggle<CR>",
                desc = "AI Clear",
            },
            {
                "<leader>ac",
                ":TabnineChat<CR>",
                desc = "AI Chat",
            },
            {
                "<leader>as",
                ":TabnineStatus<CR>",
                desc = "AI Status",
            },

            -- { "<leader>;", "<Esc><CMD>CodeSnap<CR>", mode = "x", hidden = true },
        })
    end,
}
