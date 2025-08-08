local fzf_lua = require("fzf-lua")

local function open_preview(selection)
    local selected = selection[1]
    if not selected then return end

    local cmd = "echo " .. vim.fn.shellescape(selected) .. " | awk -F'|' '{print \"\\\\d\" $3}' | pgcli postgres://postgres:FCp9N4faxDQvjL59@127.0.0.1:5432/vdelo | grep \\|"
    vim.cmd("terminal " .. cmd)
end

local function find_tables()
    fzf_lua.fzf_exec(
        "echo '\\dt' | pgcli postgres://postgres:FCp9N4faxDQvjL59@127.0.0.1:5432/vdelo | grep table",
        {
            prompt = "Tables> ",
            preview = "echo {} | awk -F'|' '{print \"\\\\d\" $3}' | pgcli postgres://postgres:FCp9N4faxDQvjL59@127.0.0.1:5432/vdelo | grep \\|",
            actions = {
                ["default"] = open_preview
            },
        }
    )
end

vim.api.nvim_create_user_command(
    "FindTables",
    find_tables,
    { nargs = 0 }
)
