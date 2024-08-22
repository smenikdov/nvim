local function find(tbl, func)
    for i, el in pairs(tbl) do
        if func(el, i) then
            return el
        end
    end
    return nil
end

local function find_index(tbl, func)
    for i, el in pairs(tbl) do
        if func(el, i) then
            return el
        end
    end
    return -1
end

local function map(tbl, func)
    local new_table = {}
    for i, el in pairs(tbl) do
        table.insert(new_table, func(el, i))
    end
    return new_table
end

return {
    find = find,
    find_index = find_index,
    map = map,
}
