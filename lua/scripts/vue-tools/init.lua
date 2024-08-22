local buffers_utils = require("scripts.utils.buffers")
local file_utils = require("scripts.utils.files")
local move = require("scripts.vue-tools.move")
local show = require("scripts.vue-tools.show")
local check = require("scripts.vue-tools.check")


local function add_block_item(block_name)
    -- TODO
end

local function smart_scipt_definition(word, line, line_index, file_content)
    local is_import_line = check.is_import_line(line)
    if is_import_line then
        move.by_import_line(line)
        return
    end

    local is_export_line = check.is_export_line(line)
    if is_export_line then
        -- local buffer_name = vim.api.nvim_buf_get_name();
        -- TODO telescope search
        return
    end

    local is_constant = check.is_constant(word, line)
    if is_constant then
        move.to_constant(word)
        return
    end

    local is_dispatch = check.is_dispatch(word, line)
    if is_dispatch then
        move.to_dispatch(word)
        return
    end

    local is_variable = check.is_variable(word)
    if is_variable then
        local is_vue_variable = check.is_vue_variable(word, line)
        if is_vue_variable then
            local is_vue_variable_init = check.is_vue_variable_init(word, line)
            if is_vue_variable_init then
                show.vue_variable_references(word)
            else
                move.to_vue_variable_init(word, file_content)
            end
        else
            local is_variable_init = check.is_variable_init(word, line)
            if is_variable_init then
                show.variable_references(word)
            else
                move.to_variable_init(word, file_content)
            end
        end
        return
    end

    vim.cmd("normal! *")
end

local function smart_template_definition(word, line, line_index, file_content)
    local is_component = check.is_component(word, line)
    if is_component then
        move.to_component(word, file_content)
        return
    end

    local is_quasar_component = check.is_quasar_component(word, line)
    if is_quasar_component then
        move.to_quasar_component_docs(word)
        return
    end

    local is_constant = check.is_constant(word, line)
    if is_constant then
        move.to_constant(word)
        return
    end

    local is_dispatch = check.is_dispatch(word, line)
    if is_dispatch then
        move.to_dispatch(word)
        return
    end

    local is_template_variable = check.is_template_variable(word, line)
    if is_template_variable then
        move.to_vue_variable_init(word, file_content)
        return
    end

    vim.cmd("normal! *")
end

local function smart_style_definition(word, line, line_index, file_content)
    local is_class_name = check.is_class_name(word, line)
    if is_class_name then
        move.to_class_name(word)
        return
    end

    local is_property = check.is_css_property(word, line)
    if is_property then
        move.to_css_property_docs(word)
        return
    end

    local is_value = check.is_css_value(word, line)
    if is_value then
        -- TODO ?
        vim.cmd("normal! *")
        return
    end

    vim.cmd("normal! *")
end

local function get_global_block_type(line_index, file_content)
    local type
    for i, line in pairs(file_content) do
        local is_template_open = string.match(line, "^%s*<%s*template")
        if is_template_open then
            type = "template"
        end
        local is_script_open = string.match(line, "^%s*<%s*script")
        if is_script_open then
            type = "script"
        end
        local is_style_open = string.match(line, "^%s*<%s*style")
        if is_style_open then
            type = "style"
        end
        if i == line_index then
            return type
        end
    end
    -- TODO ?
    return type
end

local function smart_definition(word, line, line_index, file_content)
    local global_block_type = get_global_block_type(line_index, file_content);
    if global_block_type == "script" then
        smart_scipt_definition(word, line, line_index, file_content)
    elseif global_block_type == "template" then
        smart_template_definition(word, line, line_index, file_content)
    elseif global_block_type == "style" then
        smart_style_definition(word, line, line_index, file_content)
    else
        print("Error to get global block type")
    end
end

return {
    smart_definition = smart_definition,
}
