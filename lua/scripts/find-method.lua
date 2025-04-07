local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local make_entry = require "telescope.make_entry"

-- 
local function find_methods(clear, here)

    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file == "" and here then
        print("No file is currently open")
        return
    end

    pickers.new({}, {
        prompt_title = "Find Methods",
        finder = finders.new_dynamic({
            fn = function(prompt)
                prompt = prompt:gsub("%s", "")

                if prompt == "" then
                    return {}
                end


                local search_cmd = ''

                if clear then
                    local command = 'rg "(function\\s+%s\\s*\\()|(const\\s+%s\\s*=\\s*\\()" -n --column'
                    search_cmd = string.format(
                        command,
                        prompt,
                        prompt
                    )
                elseif here then
                    local command = 'rg "(function\\s+[a-zA-Z]*%s[a-zA-Z]*\\s*\\()|(const\\s+[a-zA-Z]*%s[a-zA-Z]*\\s*=\\s*\\()" -n --column %s'
                    search_cmd = string.format(
                        command,
                        prompt,
                        prompt,
                        current_file
                    )
                    print(search_cmd)
                else
                    local command = 'rg "(function\\s+[a-zA-Z]*%s[a-zA-Z]*\\s*\\()|(const\\s+[a-zA-Z]*%s[a-zA-Z]*\\s*=\\s*\\()" -n --column'
                    search_cmd = string.format(
                        command,
                        prompt,
                        prompt
                    )
                end


                local result = vim.fn.systemlist(search_cmd)
                if #result > 0 and not result[1]:match("No files were searched") then
                    return result;
                end

                return {}
            end,

            entry_maker = function(line)
                local entry = make_entry.gen_from_vimgrep({})(line)
                if not entry then return nil end

                entry.display = string.format(
                    "%s:%d:%d - %s",
                    entry.filename,
                    entry.lnum,
                    entry.col,
                    entry.text
                )
                return entry
            end
        }),

        -- sorter = conf.generic_sorter({}),

        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    vim.api.nvim_command("edit " .. selection.filename)
                    vim.api.nvim_command(":" .. selection.lnum)
                end
            end)
            return true
        end,
        previewer = conf.grep_previewer({}),
    }):find()
end

vim.api.nvim_create_user_command(
    "FindCurrentMethod",
    function ()
        find_methods(true, false)
    end,
    { nargs = 0 }
)
vim.api.nvim_create_user_command(
    "FindLocalMethods",
    function ()
        find_methods(false, true)
    end,
    { nargs = 0 }
)
