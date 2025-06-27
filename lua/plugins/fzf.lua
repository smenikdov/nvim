return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local actions = require("fzf-lua").actions

        require("fzf-lua").setup({
            defaults = {
                file_icons = false,
                git_icons = false,
                color_icons = false,
                no_header = true,
            },
            fzf_opts = {
                -- options are sent as `<left>=<right>`
                -- set to `false` to remove a flag
                -- set to `true` for a no-value flag
                -- for raw args use `fzf_args` instead
                ["--ansi"]           = true,
                ["--info"]           = "inline-right", -- fzf < v0.42 = "inline"
                ["--height"]         = "100%",
                ["--header-lines"]   = "0",
                ["--layout"]         = "reverse",
                ["--border"]         = "none",
                ["--highlight-line"] = true,           -- fzf >= v0.53
            },

            -- Only used when fzf_bin = "fzf-tmux", by default opens as a
            -- popup 80% width, 80% height (note `-p` requires tmux > 3.2)
            -- and removes the sides margin added by `fzf-tmux` (fzf#3162)
            -- for more options run `fzf-tmux --help`
            -- NOTE: since fzf v0.53 / sk v0.15 it is recommended to use
            -- native tmux integration by adding the below to `fzf_opts`
            -- fzf_opts = { ["--tmux"] = "center,80%,60%" }
            fzf_tmux_opts = { ["-p"] = "80%,80%", ["--margin"] = "0,0" },

            actions = {
                files = {
                    ["enter"] = actions.file_edit_or_qf,
                    ["ctrl-k"] = { fn = actions.file_sel_to_qf, prefix = "select-all" },
                },
            },

            winopts = {
                -- split = "belowright new",-- open in a split instead?
                -- "belowright new"  : split below
                -- "aboveleft new"   : split above
                -- "belowright vnew" : split right
                -- "aboveleft vnew   : split left
                -- Only valid when using a float window
                -- (i.e. when 'split' is not defined, default)
                height           = 0.85,            -- window height
                width            = 0.80,            -- window width
                row              = 0.35,            -- window row position (0=top, 1=bottom)
                col              = 0.50,            -- window col position (0=left, 1=right)
                -- border argument passthrough to nvim_open_win()
                border           = "rounded",
                -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
                backdrop         = 60,
                -- title         = "Title",
                -- title_pos     = "center",        -- 'left', 'center' or 'right'
                -- title_flags   = false,           -- uncomment to disable title flags
                fullscreen       = false,           -- start fullscreen?
                -- enable treesitter highlighting for the main fzf window will only have
                -- effect where grep like results are present, i.e. "file:line:col:text"
                -- due to highlight color collisions will also override `fzf_colors`
                -- set `fzf_colors=false` or `fzf_colors.hl=...` to override
                treesitter       = {
                    enabled    = false,
                    fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
                },
                preview = {
                    -- default     = 'bat',           -- override the default previewer?
                    -- default uses the 'builtin' previewer
                    border         = "rounded",       -- preview border: accepts both `nvim_open_win`
                    -- and fzf values (e.g. "border-top", "none")
                    -- native fzf previewers (bat/cat/git/etc)
                    -- can also be set to `fun(winopts, metadata)`
                    wrap           = false,           -- preview line wrap (fzf's 'wrap|nowrap')
                    hidden         = false,           -- start preview hidden
                    vertical       = "down:45%",      -- up|down:size
                    horizontal     = "right:60%",     -- right|left:size
                    layout         = "flex",          -- horizontal|vertical|flex
                    flip_columns   = 100,             -- #cols to switch to horizontal on flex
                    -- Only used with the builtin previewer:
                    title          = true,            -- preview border title (file/buf)?
                    title_pos      = "center",        -- left|center|right, title alignment
                    scrollbar      = "float",         -- `false` or string:'float|border'
                    -- float:  in-window floating border
                    -- border: in-border "block" marker
                    scrolloff      = -1,              -- float scrollbar offset from right
                    -- applies only when scrollbar = 'float'
                    delay          = 20,              -- delay(ms) displaying the preview
                    -- prevents lag on fast scrolling
                    winopts = {                       -- builtin previewer window options
                        number            = true,
                        relativenumber    = false,
                        cursorline        = true,
                        cursorlineopt     = "both",
                        cursorcolumn      = false,
                        signcolumn        = "no",
                        list              = false,
                        foldenable        = false,
                        foldmethod        = "manual",
                    },
                },
                on_create = function()
                    -- called once upon creation of the fzf main window
                    -- can be used to add custom fzf-lua mappings, e.g:
                    --   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
                end,
                -- called once _after_ the fzf interface is closed
                -- on_close = function() ... end
            },
        })
    end
}
