local fzf_lua = require("fzf-lua")

local function find_routes()
    fzf_lua.fzf_exec(
        'rg  -n --column --type js --glob "**/routes/**" "url:.+"',
        {
            prompt = "Routes> ",
            previewer = "builtin",
            actions = {
                ["default"] = fzf_lua.actions.file_edit,
            },
        }
    )
end

vim.api.nvim_create_user_command(
    "FindRoute",
    find_routes,
    { nargs = 0 }
)
