return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			opts = {
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
			},
		},
	},

    opts = {
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil,
        default_component_configs = {
            container = {
                enable_character_fade = true,
            },
            indent = {
                indent_size = 2,
                padding = 1,
                with_markers = true,
                indent_marker = "│",
                last_indent_marker = "└",
                highlight = "NeoTreeIndentMarker",
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            icon = {
                folder_closed  = "",
                folder_open  = "",
                folder_empty = "",
                default = "",
                highlight = "NeoTreeFileIcon",
            },
            modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
            },
            name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
            git_status = {
                symbols = {
                    added = "✚",
                    modified = "",
                    deleted = "✖",
                    renamed = "󰁕",
                    untracked = "✚",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = "",
                },
            },
            file_size = {
                enabled = true,
                required_width = 64,
            },
            type = {
                enabled = true,
                required_width = 122,
            },
            last_modified = {
                enabled = true,
                required_width = 88,
            },
            created = {
                enabled = true,
                required_width = 110,
            },
            symlink_target = {
                enabled = false,
            },
        },
        -- A list of functions, each representing a global custom command
        -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
        -- see `:h neo-tree-custom-commands-global`
        commands = {},
        window = {
            position = "right",
            width = 40,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ["q"] = "close_window",
                ["<CR>"] = "open",
                ["R"] = "refresh",
                ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                ["g?"] = "show_help",
                ["C"] = "close_node",
                ["<"] = "prev_source",
                [">"] = "next_source",

                ["<2-LeftMouse>"] = "",
                ["<space>"] = "",
                ["<esc>"] = "",
                ["S"] = "",
                ["s"] = "",
                ["t"] = "",
                ["l"] = "",
                ["Z"] = "",
                ["z"] = "",
                ["w"] = "",
                [";"] = "",
                ["?"] = "",

                ["a"] = {
                    "add",
                    -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = "none", -- "none", "relative", "absolute"
                    },
                },

                ["A"] = "add_directory",
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["i"] = "show_file_details",

                ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            },
        },

        nesting_rules = {},

        filesystem = {
            renderers = {
                file = {
                    { "icon" },
                    { "name", use_git_status_colors = true },
                    { "diagnostics" },
                    { "git_status", highlight = "NeoTreeDimText" },
                },
            },
            bind_to_cwd = false,
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = true,
                hide_gitignored = true,
                hide_hidden = true, -- only works on Windows for hidden files/directories
                hide_by_name = {
                    --"node_modules"
                },
                hide_by_pattern = { -- uses glob style patterns
                    --"*.meta",
                    --"*/src/*/tsconfig.json",
                    "*.fla",
                    "*.png",
                    "*.docx",
                    -- "*/tests",
                    "*/demon",
                    "*/dump",
                    "*/i18n",
                    -- "*/sort-migrate.js",
                },
                always_show = { -- remains visible even if other settings would normally hide it
                    --".gitignored",
                    "sandbox",
                    "spell",
                    "test",
                },
                always_show_by_pattern = { -- uses glob style patterns
                    ".env*",
                },
                never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                    --".DS_Store",
                    --"thumbs.db"
                },
                never_show_by_pattern = { -- uses glob style patterns
                    --".null-ls_*",
                },
            },
            follow_current_file = {
                enabled = false, -- This will find and focus the file in the active buffer every time
                --               -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = false, -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            window = {
                mappings = {
                    ["-"] = "navigate_up",
                    ["_"] = "set_root",
                    ["g."] = "toggle_hidden",

                    ["H"] = "",
                    ["."] = "",
                    ["/"] = "",
                    ["D"] = "",
                    ["#"] = "",
                    ["f"] = "",
                    ["<c-x>"] = "",
                    ["o"] = "",
                    ["[g"] = "",
                    ["]g"] = "",


                    ["oc"] = { "order_by_created", nowait = false },
                    ["od"] = { "order_by_diagnostics", nowait = false },
                    ["og"] = { "order_by_git_status", nowait = false },
                    ["om"] = { "order_by_modified", nowait = false },
                    ["on"] = { "order_by_name", nowait = false },
                    ["os"] = { "order_by_size", nowait = false },
                    ["ot"] = { "order_by_type", nowait = false },
                },
                fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                    ["<down>"] = "move_cursor_down",
                    ["<C-n>"] = "move_cursor_down",
                    ["<up>"] = "move_cursor_up",
                    ["<C-p>"] = "move_cursor_up",
                    -- ['<key>'] = function(state, scroll_padding) ... end,
                },
            },

            commands = {}, -- Add a custom command or override a global one using the same function name
        },

        buffers = {
            follow_current_file = {
                enabled = true, -- This will find and focus the file in the active buffer every time
                --              -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
            window = {
                mappings = {
                    ["bd"] = "buffer_delete",
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                    ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                    ["oc"] = { "order_by_created", nowait = false },
                    ["od"] = { "order_by_diagnostics", nowait = false },
                    ["om"] = { "order_by_modified", nowait = false },
                    ["on"] = { "order_by_name", nowait = false },
                    ["os"] = { "order_by_size", nowait = false },
                    ["ot"] = { "order_by_type", nowait = false },
                },
            },
        },
        git_status = {
            window = {
                position = "float",
                mappings = {
                    ["A"] = "git_add_all",
                    ["gu"] = "git_unstage_file",
                    ["ga"] = "git_add_file",
                    ["gr"] = "git_revert_file",
                    ["gc"] = "git_commit",
                    ["gp"] = "git_push",
                    ["gg"] = "git_commit_and_push",
                    ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                    ["oc"] = { "order_by_created", nowait = false },
                    ["od"] = { "order_by_diagnostics", nowait = false },
                    ["om"] = { "order_by_modified", nowait = false },
                    ["on"] = { "order_by_name", nowait = false },
                    ["os"] = { "order_by_size", nowait = false },
                    ["ot"] = { "order_by_type", nowait = false },
                },
            },
        },
    }
}
