local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local string_utils = require("scripts.utils.string")

local function generate_attrs_string(attrs)
    if (not attrs) then
        return ""
    end
    local attr_string = "\n\t"
    for i, attr in pairs(attrs) do
        attr_string = attr_string .. attr .. '="{}"\n'
        if (i ~= #attrs) then
            attr_string = attr_string .. "\t"
        end
    end
    return attr_string
end

local function tag(tag_name, attrs)
    local args = {
        content = i(1),
        tag = t(tag_name),
    }
    if (attrs) then
        for index, attr in pairs(attrs) do
            table.insert(args, i(index))
        end
    end
    return fmt(
        "<{tag}" .. generate_attrs_string(attrs) .. ">{content}</{tag}>",
        args
    )
end

local function one_tag(tag_name, attrs)
    local args = {
        tag = t(tag_name),
    }
    if (attrs) then
        for index, attr in pairs(attrs) do
            table.insert(args, i(index))
        end
    end
    return fmt(
        "<{tag}" .. generate_attrs_string(attrs) .. ">",
        args
    )
end

local function check_prefix(prefix)
    return function(line_to_cursor, matched_trigger, captures)
        if string.find(line_to_cursor, prefix) then
            return true
        else
            return false
        end
        -- string_utils.ends_with(line_to_cursor, prefix)
    end
end

return {
    tag = tag,
    one_tag = one_tag,
    check_prefix = check_prefix,
}
