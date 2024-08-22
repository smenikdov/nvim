local string_utils = require("scripts.utils.string")

local function is_variable(word, line)
    return string.find(word, "^[A-Za-z][A-Za-z0-9_]*$")
end

local function is_constant(word, line)
    return is_variable(word) and string.find(line, "%$constants%.[.A-Za-z0-9]*" .. word)
end

local function is_variable_init(word, line)
    return string.find(line, "const%s+" .. word)
        or string.find(line, "let%s+" .. word)
        or string.find(line, "var%s+" .. word)
end

local function is_vue_variable_init(word, line)
    return string.find(line, "^%s*" .. word .. "%s*:")
        or string.find(line, "^%s*" .. word .. "%s*%(")
        or string.find(line, "^%s*async%s+" .. word .. "%s*%(")
end

local function is_quasar_component(word, line)
    return string.find(line, "q%-" .. word)
end

local function is_export_line(line)
    return string.find(line, "^%s*export%s*default%s*{")
end

local function is_import_line(line)
    return string.find(line, "^%s*import")
end

local function is_component(name, line)
    -- TODO more checks
    return string.find(line, "<%s*" .. name) and string.find(name, "^[A-Z][A-Za-z]+$")
end

local function is_vue3(file_content)
    for i, line in pairs(file_content) do
        if string.find(line, "^%s*<script%s+setup") then
            return true
        end
    end
    return false
end

local function is_vue_variable(word, line)
    return string.find(line, "this." .. word)
end

local function is_class_name(word, line)
    -- TODO
    return string.find(line, "^%s*" .. word .. "%s*:")
end

local function is_css_property(word, line)
    -- TOOD with - words
    return string.find(line, "^%s*" .. word .. "%s*:")
end

local function is_css_value(word, line)
    -- TODO with - words
    return string.find(line, "^.+:%s" .. word .. ";")
end

local function is_tag_name(word, line)
    -- TODO with - words
end

local function is_dispatch(word, line)
    return string.find(line, "dispatch(." .. word .. ".)")
end

local function is_template_variable(word, line)
    return is_variable(word)
end

return {
    is_constant = is_constant,
    is_variable = is_variable,
    is_variable_init = is_variable_init,
    is_vue_variable_init = is_vue_variable_init,
    is_quasar_component = is_quasar_component,
    is_export_line = is_export_line,
    is_import_line = is_import_line,
    is_component = is_component,
    is_vue3 = is_vue3,
    is_vue_variable = is_vue_variable,
    is_class_name = is_class_name,
    is_css_property = is_css_property,
    is_css_value = is_css_value,
    is_tag_name = is_tag_name,
    is_dispatch = is_dispatch,
    is_template_variable = is_template_variable,
}
