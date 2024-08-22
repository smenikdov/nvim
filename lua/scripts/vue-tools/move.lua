local buffers_utils = require("scripts.utils.buffers")
local file_utils = require("scripts.utils.files")
local vue_utils = require("scripts.vue-tools.utils")
local helpers = require("scripts.utils.helpers")
local check = require("scripts.vue-tools.check")

local function to_block(block_name)
    local file_content = buffers_utils.get_current_buffer_content();
    if file_content ~= nil then
        print("Error to find block " .. block_name .. ". Can't get file content")
        return
    end
    local line_index = vue_utils.find_index_of_block(block_name, file_content)
    if (line_index == -1) then
        print("Error to find block " .. block_name .. ". Can't get line index")
        return
    end
    buffers_utils.move_cursor_in_current_window(line_index)
end

local function to_vue_variable_init(name, file_content)
    for i, line in pairs(file_content) do
        if check.is_vue_variable_init(name, line) then
            buffers_utils.move_cursor_in_current_window(i)
            return
        end
    end
    print("Vue variable init not found")
    -- TODO?
end

local function to_variable_init(name, file_content)
    -- TODO FROM PLACE TO TOP
    for i, line in pairs(file_content) do
        if check.is_variable_init(name, line) then
            buffers_utils.move_cursor_in_current_window(i)
            return
        end
    end
    print("Variable init not found")
    -- TODO?
end

local function to_constant(name)
    local full_path = vim.fn.glob("src/boot/constants.js")
    file_utils.open_file_in_new_buffer(full_path)
    local constants_content = buffers_utils.get_current_buffer_content()
    for i, line in ipairs(constants_content) do
        if string.match(line, name) then
            buffers_utils.move_cursor_in_current_window(i)
            return
        end
    end
    print("Error to find constant")
end

local function to_dispatch(name)
    -- TODO
end

local function by_import_line(import_line)
    local import_paths = {
        {
            short = "src",
            path = "/",
        },
        {
            short = "components",
            path = "/src/",
        },
        {
            short = "layouts",
            path = "/src/",
        },
        {
            short = "pages",
            path = "/src/",
        },
        {
            short = "pages",
            path = "/src/",
        },
        {
            short = "assets",
            path = "/src/",
        },
        {
            short = "boot",
            path = "/src/",
        },
    }
    local path = file_utils.get_path_from_import_line(import_line)

    if (path == nil) then
        print("File import not found")
    else
        local cwd = vim.fn.getcwd()
        local full_path = ""

        if string.find(path, "^%./") or string.find(path, "^%.%./") then
            local current_path = buffers_utils.get_current_buffet_path()
            full_path = file_utils.join_paths(current_path, path)
        else
            for i, import_path in pairs(import_paths) do
                if string.find(path, "^" .. import_path.short) then
                    full_path = cwd .. import_path.path .. path
                    break
                end
            end
        end

        if full_path then
            if not string.find(full_path, ".vue") and not string.find(full_path, ".js") then
                full_path = vim.fn.glob(full_path .. ".*")
            end
            file_utils.open_file_in_new_buffer(full_path)
            return
        end

        print("File path not found")
    end
end

local function to_css_property_docs(name)
    helpers.open_url_with_confirm("https://developer.mozilla.org/en-US/docs/Web/CSS/" .. name)
end

local function to_quasar_component_docs(name)
    helpers.open_url_with_confirm("https://quasar.dev/vue-components/" .. name)
end

-- local function get_component_path(name, file)
--     -- TODO
--     local path = vim.fn.glob("**/" .. name .. ".vue")[0]
--     return path or nil
-- end

local function to_component(name, file_content)
    for i, line in pairs(file_content) do
        if string.find(line, "%s*import.+" .. name) then
            by_import_line(line)
            return
        end
    end
    print("Component import not found")
end

return {
    to_block = to_block,
    to_vue_variable_init = to_vue_variable_init,
    to_variable_init = to_variable_init,
    to_constant = to_constant,
    to_dispatch = to_dispatch,
    by_import_line = by_import_line,
    to_css_property_docs = to_css_property_docs,
    to_quasar_component_docs = to_quasar_component_docs,
    to_component = to_component,
}
