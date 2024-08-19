local buffers_utils = require("scripts.utils.buffers")
local file_utils = require("scripts.utils.files")
local vue_utils = require("scripts.vue-tools.utils")
local helpers = require("scripts.utils.helpers")
local check = require("scripts.vue-tools.check")

local function to_block(block_name)
    local file_content = buffers_utils.get_current_buffer_content();
    if ~file_content then
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
    -- TODO?
end

local function to_constant(name)
    -- TODO
end

local function to_dispatch(name)
    -- TODO
end

local function by_import_line(import_line)
    local path = vue_utils.get_path_from_import_line(import_line)
    if (~path) then
        -- TODO
    else
        vim.cmd.edit(file_utils.normalize_path(path))
    end
end

local function to_css_property_docs(name)
    helpers.open_url("https://developer.mozilla.org/en-US/docs/Web/CSS/" .. name)
end

local function to_css_value_docs(name)
end

local function to_quasar_component_docs(name)
    helpers.open_url("https://quasar.dev/vue-components/" .. name)
end

local function to_component(name, file_content)
    local path = get_component_path(name, file_content)
    if (~path) then
    else
        vim.cmd.edit(path)
    end
end

return {
    to_block = to_block,
    to_vue_variable_init = to_vue_variable_init,
    to_variable_init = to_variable_init,
    to_constant = to_constant,
    to_dispatch = to_dispatch,
    by_import_line = by_import_line,
    to_css_property_docs = to_css_property_docs,
    to_css_value_docs = to_css_value_docs,
    to_quasar_component_docs = to_quasar_component_docs,
    to_component = to_component,
}
