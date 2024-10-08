local list_utils = require("scripts.utils.list")
local table_utils = {}

function table_utils.assign(t, props)
    for k, v in pairs(props) do
        t[k] = v
    end
end

function table_utils.merge(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end

    return t1
end

function table_utils.is_array(t)
    return type(t[1]) == "number"
end

function table_utils.typeof(value)
    if type(value) == "table" then
        if table_utils.is_array(value) then
            return "array"
        else
            return "table"
        end
    end

    return type(value)
end

function table_utils.serialize_array(t)
    local result = list_utils.map(t, function(ele)
        table_utils.to_string(ele)
    end)

    return "[" .. result.concat(t, ",") .. "]"
end

function table_utils.serialize_table(t)
    local result = {}

    for key, value in pairs(t) do
        table.insert(result, string.format("%s = %s", key, table_utils.to_string(value)))
    end

    return "{" .. table.concat(result, ",") .. "}"
end

function table_utils.serialize_string(value)
    return "[[" .. value .. "]]"
end

function table_utils.to_string(t)
    local complex_type_parser = {
        array = table_utils.serialize_array,
        table = table_utils.serialize_table,
        string = table_utils.serialize_string,
    }

    local parse = complex_type_parser[table_utils.typeof(t)] or function(v)
        return v
    end

    return parse(t)
end

function table_utils.find(tbl, func)
    for i, el in pairs(tbl) do
        if func(el, i) then
            return el
        end
    end
    return nil
end

function table_utils.find_index(tbl, func)
    for i, el in pairs(tbl) do
        if func(el, i) then
            return el
        end
    end
    return -1
end

function table_utils.map(tbl, func)
    local new_table = {}
    for i, el in pairs(tbl) do
        table.insert(new_table, func(el, i))
    end
    return new_table
end

function table_utils.includes(tbl, value)
    for i, el in pairs(tbl) do
        if (el == value) then
            return true
        end
    end
    return false
end

-- function table_utils.to_string(t)
--   local result = ""
--
--   for key, value in pairs(t) do
--     result = result .. key .. ":" .. tostring(value) .. ","
--   end
--
--   return "{" .. result .. "}"
-- end

return table_utils
