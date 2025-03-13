local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local make_entry = require "telescope.make_entry"

local function find_routes()
    pickers.new({}, {
        prompt_title = "Find Routes (enter url pattern)",
        finder = finders.new_dynamic({
            fn = function(prompt)
                prompt = prompt:gsub("api", "")
                prompt = prompt:gsub("%s", "")
                prompt = prompt:gsub("//", "/")

                if prompt:sub(1, 1) == "/" then
                    prompt = prompt:sub(2)
                end

                if prompt == "" then
                    return {}
                end

                local clear_prompt = prompt:gsub('%d+', ':[a-zA-Z]+')
                -- Первый запрос
                local search_cmd1 = string.format(
                    'rg --type js --glob "**/point.js" "url:.+%s" -n --column',
                    clear_prompt
                )

                local results = {}
                local results1 = vim.fn.systemlist(search_cmd1)
                if #results1 > 0 and not results1[1]:match("No files were searched") then
                    results = results1
                end

                -- Второй запрос: только если есть слеш
                if prompt:find("/") then
                    local folder_part = prompt:match("^[^/]+/")
                    local url_part = prompt:gsub(folder_part, "")
                    local clear_url_part  = url_part:gsub('%d+', ':.+')
                    local search_cmd2 = string.format(
                        'rg --type js --glob "**/%spoint.js" "url:\\s.+[\'\\"]/%s" -n --column',
                        folder_part,
                        clear_url_part
                    )

                    local results2 = vim.fn.systemlist(search_cmd2)

                    if #results2 > 0 and not results2[1]:match("No files were searched") then
                        for _, value in ipairs(results2) do
                            table.insert(results, value)
                        end
                    end
                end

                return results
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

-- Создаем команду
vim.api.nvim_create_user_command(
    "FindRoute",
    find_routes,
    { nargs = 0 }
)

-- Keymap
vim.keymap.set("n", "<leader>fr", find_routes, { desc = "Find Route" })
