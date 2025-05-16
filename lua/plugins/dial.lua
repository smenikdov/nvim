return {
    "monaqa/dial.nvim",
    recommended = true,
    desc = "Increment and decrement numbers, dates, and more",
    

    opts = function()
        local augend = require("dial.augend")
        local a = {}

        a.join = augend.constant.new({
            elements = { "INNER JOIN", "LEFT JOIN", "RIGHT JOIN", "FULL JOIN" },
            word = false,
            cyclic = true,
        })

        a.bool_up = augend.constant.new({
            elements = { "TRUE", "FALSE" },
            word = true,
            cyclic = true,
        })

        a.and_or = augend.constant.new({
            elements = { "and", "or" },
            word = true,
            cyclic = true,
        })

        a.on_off = augend.constant.new({
            elements = { "on", "off" },
            word = true,
            cyclic = true,
        })

        a.min_max = augend.constant.new({
            elements = { "min", "max" },
            word = true,
            cyclic = true,
        })

        a.logical_alias = augend.constant.new({
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
        })

        a.dart_types = augend.constant.new({
            elements = { "int", "double", "String", "bool" },
            word = true,
            cyclic = true,
        })

        a.column_row = augend.constant.new({
            elements = { "Column", "Row" },
            word = true,
            cyclic = true,
        })

        a.equal_not_eqaul = augend.constant.new({
            elements = { "===", "!==" },
            word = false,
            cyclic = true,
        })

        a.bigger_smaller = augend.constant.new({
            elements = { "<", ">" },
            word = false,
            cyclic = true,
        })

        a.model_value = augend.constant.new({
            elements = { "v-model=", ":value=" },
            word = false,
            cyclic = true,
        })

        a.english_ordinal_numbers = augend.constant.new({
            elements = {
                "first",
                "second",
                "third",
                "fourth",
                "fifth",
                "sixth",
                "seventh",
                "eighth",
                "ninth",
                "tenth",
            },
            word = false,
            cyclic = true,
        })

        a.english_weekdays = augend.constant.new({
            elements = {
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday",
                "Sunday",
            },
            word = true,
            cyclic = true,
        })

        a.english_months = augend.constant.new({
            elements = {
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December",
            },
            word = true,
            cyclic = true,
        })

        a.let_const = augend.constant.new({
            elements = { "let", "const" },
            word = true,
            cyclic = true,
        })

        a.tech_admin = augend.constant.new({
            elements = { "в техподдержку", "к администратору" },
            word = false,
            cyclic = true,
        })

        a.notify = augend.constant.new({
            elements = { "$error", "$warning", "$success" },
            word = false,
            cyclic = true,
        })

        a.colors = augend.constant.new({
            elements = { "grey", "positive", "primary", "nagative" },
            word = false,
            cyclic = true,
        })

        a.sizes = augend.constant.new({
            elements = { "none", "xs", "sm", "md", "lg", "xl" },
            word = true,
            cyclic = true,
        })

        a.directions = augend.constant.new({
            elements = {
                "top",
                "right",
                "bottom",
                "left",
            },
            word = true,
            cyclic = true,
        })

        a.axis = augend.constant.new({
            elements = {
                "mainAxisAlignment",
                "crossAxisAlignment",
            },
            word = true,
            cyclic = true,
        })

        a.axis_captial = augend.constant.new({
            elements = {
                "MainAxisAlignment",
                "CrossAxisAlignment",
            },
            word = true,
            cyclic = true,
        })

        a.super_this = augend.constant.new({
            elements = {
                "super",
                "this",
            },
            word = true,
            cyclic = true,
        })

        a.const_final = augend.constant.new({
            elements = {
                "const",
                "final",
            },
            word = true,
            cyclic = true,
        })

        a.justify_class = augend.constant.new({
            elements = {
                "justify-start",
                "justify-center",
                "justify-between",
                "justify-around",
                "justify-end",
            },
            word = false,
            cyclic = true,
        })

        a.axios_post_get = augend.constant.new({
            elements = { "$axios.post", "$axios.get" },
            word = false,
            cyclic = true,
        })

        a.items_class = augend.constant.new({
            elements = {
                "items-start",
                "items-cetner",
                "items-end",
            },
            word = false,
            cyclic = true,
        })

        a.js_types = augend.constant.new({
            elements = {
                "Boolean",
                "Number",
                "String",
                "Object",
                "Array",
            },
            word = true,
            cyclic = true,
        })


        local f = {}
        f.default = {
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
            augend.date.alias["%Y/%m/%d"],
            a.english_ordinal_numbers,
            a.english_weekdays,
            a.english_months,
        }

        f.javascript = {
            -- GLOBAL
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
            a.logical_alias,
            a.let_const,
            a.equal_not_eqaul,
            -- VDELO
            a.tech_admin,
            a.notify,
            a.axios_post_get,
        }

        f.dart = {
            -- GLOBAL
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
            a.logical_alias,
            a.dart_types,
            a.column_row,
            a.directions,
            a.axis,
            a.axis_captial,
            a.super_this,
            a.const_final,
            -- VDELO
        }

        f.sql = {
            -- GLOBAL
            augend.integer.alias.decimal,
            a.join,
            a.bool_up,
            -- VDELO
        }

        f.css = {
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
            a.directions,
        }

        f.json = {
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
            augend.semver.alias.semver,
        }

        f.lua = {
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
        }

        f.vue = {
            -- GLOBAL
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
            a.logical_alias,
            a.let_const,
            a.equal_not_eqaul,
            a.colors,
            a.sizes,
            a.js_types,
            a.directions,
            -- VDELO
            a.tech_admin,
            a.notify,
            a.justify_class,
            a.items_class,
            a.model_value,
        }
        return {
            groups = {
                default = f.default,
                javascript = f.javascript,
                css = f.css,
                scss = f.css,
                json = f.json,
                lua = f.lua,
                vue = f.vue,
                dart = f.dart,
                sql = f.sql,
            },
        }
    end,

    config = function(_, opts)
        local table_utils = require("scripts.utils.table")
        require("dial.config").augends:register_group(opts.groups)

        local filetypes = {
            "javascript",
            "lua",
            "json",
            "css",
            "scss",
            "vue",
            "dart",
            "sql",
        }

        vim.api.nvim_create_augroup("Dial", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = "Dial",
            pattern = filetypes,

            callback = function()
                local ft = vim.bo.filetype
                if table_utils.includes(filetypes, ft) then
                    vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal(ft), { noremap = true })
                    vim.api.nvim_buf_set_keymap(0, "n", "<C-x>", require("dial.map").dec_normal(ft), { noremap = true })
                end
            end
        })
    end,
}
