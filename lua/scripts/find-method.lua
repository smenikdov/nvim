local fzf_lua = require("fzf-lua")

local function search_functions_and_constants()
    fzf_lua.fzf_live(
        function(query)
            query = query:gsub('[^a-zA-Z_0-9]', '')
            return 'rg --column -n "(function\\s+' .. query .. '\\s*\\()|(const\\s+' .. query .. '\\s*=\\s*\\()"'
        end,
        {
            prompt = "Functions> ",
            previewer = "builtin",
            actions = {
                ["default"] = fzf_lua.actions.file_edit,
            },
        }
    )
end

vim.api.nvim_create_user_command("FindMethod", search_functions_and_constants, {})
