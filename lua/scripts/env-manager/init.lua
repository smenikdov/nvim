local buffers_utils = require("scripts.utils.buffers")
local string_utils = require("scripts.utils.string")
local table_utils = require("scripts.utils.table")
local files_utils = require("scripts.utils.files")

-- ! ALL NAMES SHOULD BE UNIC
--

local prefix = ""

local function get_env_path()
    local env_path = vim.fn.findfile(".env", "**")
    return env_path
end

local function get_env_file()
    local env_path = get_env_path()
    if not env_path then
        return
    end

    local env = vim.fn.readfile(env_path)
    return env
end

local function set_source_active_state_name(source_name, source_state_name)
    local temp_env_manager_sources = vim.g.env_manager_sources
    local source = table_utils.find(temp_env_manager_sources, function(source)
        return source.name == source_name
    end)
    if not source then
        print("Source with such name not found")
        return
    end
    source.active_state_name = source_state_name
    vim.g.env_manager_sources = temp_env_manager_sources
end


local function env_set_fields(fields, is_need_print)
    local env = get_env_file()
    if not env then
        print("Can't read env file")
        return
    end
    for line_index = #env, 1, -1 do
        local line = env[line_index]
        for field_index, field in ipairs(fields) do
            if string.find(line, "^%s*" .. field.name .. "%s*=") then
                table.remove(env, line_index)
            end
        end
    end
    for field_index, field in ipairs(fields) do
        table.insert(env, 1, field.name .. "=" .. field.value)
    end

    local env_path = get_env_path()
    if not env_path then
        return
    end
    vim.fn.writefile(env, env_path)
    if is_need_print then
        print("State successful updated")
    end
end

local function set_source_state(source_name, source_state_name)
    if not vim.g.env_manager_sources then
        print("You didnt setup any sources")
        return nil
    end
    local source = table_utils.find(vim.g.env_manager_sources, function(source)
        return source.name == source_name
    end)
    if not source then
        print("Source with such name not found")
        return
    end
    if not source.states then
        print("Source states is empty")
        return
    end
    local state = table_utils.find(source.states, function(state)
        return state.name == source_state_name
    end)
    if not state then
        print("State with such name not found")
        return
    else
        if not state.fields then
            print("You have state without fields")
            return
        end
        set_source_active_state_name(source.name, source_state_name)
        local fields_to_apply = {
            {
                name = prefix .. source_name,
                value = source_state_name,
            },
        }
        for field_index, field in ipairs(state.fields) do
            table.insert(fields_to_apply, field)
        end
        env_set_fields(fields_to_apply, true)
    end
end

local function get_source_state_name(source_name)
    if not vim.g.env_manager_sources then
        return nil
    end
    local source = table_utils.find(vim.g.env_manager_sources, function(source)
        return source.name == source_name
    end)
    if not source then
        return nil
    end
    return source.active_state_name
end

local function get_env_value(key, env)
    if not env then
        env = get_env_file()
        if not env then
            return nil
        end
    end
    for i, line in pairs(env) do
        local match = string.find(line, "^%s*" .. key .. "%s*=.+$")
        if match then
            local pos = string.find(line, "=")
            if pos then
                return string.sub(line, pos + 1)
            else
                return nil
            end
        end
    end
    return nil
end

local function setup(opts)
    vim.g.env_manager_sources = vim.g.env_manager_sources or {}
    local env_manger_path     = opts.env_manger_path or "scripts/env-manager/env-ignore"
    prefix                    = opts.prefix or "ENV_MANAGER_"
    local projects            = require(env_manger_path)
    local env                 = get_env_file()
    if not env then
        print("Can't read env file")
        return
    end

    local project_name = get_env_value(prefix .. "PROJECT_NAME")
    if not project_name then
        print("You need add in .env " .. prefix .. "PROJECT_NAME")
        return
    end

    local project_data = table_utils.find(projects, function(project)
        return project.name == project_name
    end)

    if not project_data then
        print("Can't find project with such name. Check env variable " .. prefix .. "PROJECT_NAME")
        return
    end

    if not project_data.sources then
        print("You need add some project sources")
        return
    end

    vim.g.env_manager_sources = project_data.sources

    local fields_to_apply = {}
    for source_index, source in ipairs(vim.g.env_manager_sources) do
        local source_state_name = get_env_value(prefix .. source.name)
        if not source_state_name then
            set_source_active_state_name(source.name, "unset")
            -- TOOD ?
        else
            local state = table_utils.find(source.states, function(state)
                return state.name == source_state_name
            end)
            if not state then
                set_source_active_state_name(source.name, "incorrect")
                print("You have unknown " .. prefix .. source.name .. " value")
            else
                set_source_active_state_name(source.name, source_state_name)
                if not state.fields then
                    print("You have state without fields")
                else
                    for field_index, field in ipairs(state.fields) do
                        table.insert(fields_to_apply, field)
                    end
                end
            end
        end
    end

    print(vim.g.env_manager_sources[1].name)
    print(vim.g.env_manager_sources[1].active_state_name)

    env_set_fields(fields_to_apply)

    vim.api.nvim_create_user_command("EnvManagerSetSourceState", function(opts)
        local fargs = opts.fargs
        set_source_state(fargs[1], fargs[2])
    end, {
        nargs = "*",
        complete = function(arg_lead, cmd_line, cursor_pos)
            local args = vim.split(cmd_line, "%s")
            if #args == 2 then
                return table_utils.map(vim.g.env_manager_sources, function(source)
                    return source.name
                end)
            end
            if #args == 3 then
                local source = table_utils.find(vim.g.env_manager_sources, function(source)
                    return source.name == args[2]
                end)
                if source and source.states then
                    return table_utils.map(source.states, function(state)
                        return state.name
                    end)
                else
                    return {}
                end
            end
        end,
    })

    -- vim.api.nvim_create_user_command("EnvManagerGetActiveName", function(opts)
    --     local fargs = opts.fargs
    --     get_source_state_name(fargs[1])
    -- end, {
    --     nargs = 1,
    --     complete = function()
    --         local suggersions = table_utils.map(sources, function(source)
    --             return source.name
    --         end)
    --         return suggersions
    --     end,
    -- })
end

return {
    setup = setup,
    get_source_state_name = get_source_state_name,
}
