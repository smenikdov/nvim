local function get_block_pattern_for_property(name)
    return "^%s*" .. name .. "%s*:%s*{"
end

local function get_block_pattern_for_method(name)
    return "^%s*" .. name .. "%s*(%s*)%s*{"
end

local blocks_list = {
    {
        name = "methods",
        pattern = get_block_pattern_for_property("methods"),
    },
    {
        name = "computed",
        pattern = get_block_pattern_for_property("computed"),
    },
    {
        name = "data",
        pattern = get_block_pattern_for_method("data"),
    },
    {
        name = "created",
        pattern = get_block_pattern_for_method("created"),
    },
    {
        name = "mounted",
        pattern = get_block_pattern_for_method("mounted"),
    },
    {
        name = "updated",
        pattern = get_block_pattern_for_method("updated"),
    },
    {
        name = "beforeDestroy",
        pattern = get_block_pattern_for_method("beforeDestroy"),
    },
    {
        name = "components",
        pattern = get_block_pattern_for_property("components"),
    },
    {
        name = "props",
        pattern = get_block_pattern_for_property("props"),
    },
    {
        name = "watch",
        pattern = get_block_pattern_for_property("watch"),
    },
}

local function get_block_by_name(block_name)
    for i, block in pairs(blocks_list) do
        if block.name == block_name then
            return block
        end
    end
    return nil
end

local function define_block(line)
    for i, block in pairs(blocks_list) do
        local match = string.match(line, block.pattern)
        if match then
            return block.name
        end
    end
    return nil
end

local function find_index_of_block(block_name, file_content)
    local block = get_block_by_name(block_name)
    if block == nil then
        return -1
    end
    for i, line in pairs(file_content) do
        local match = string.match(line, block.pattern)
        if match then
            return i
        end
    end
    return -1
end

local function get_blocks_matches(file_content)
    local matches = {}
    for i, line in pairs(file_content) do
        local block_name = define_block(line)
        if block_name then
            table.insert(matches, {
                name = block_name,
                line_index = i,
            })
        end
    end
    return matches
end

return {
    blocks_list = blocks_list,
    get_block_by_name = get_block_by_name,
    define_block = define_block,
    find_index_of_block = find_index_of_block,
    get_blocks_matches = get_blocks_matches,
}
