local function open_file_in_new_buffer(path)
    vim.cmd.edit(path)
end

local function normalize_path(path)
    local parts = {}

    for part in string.gmatch(path, "[^/]+") do
        if part == ".." then
            if #parts > 0 then
                table.remove(parts)
            end
        elseif part ~= "." and part ~= "" then
            table.insert(parts, part)
        end
    end

    return table.concat(parts, "/")
end

local function get_path_from_import_line(line)
    local path = line:match("[\"'].+[\"']")
    if path == nil then
        return nil
    end

    return path:gsub("[\"']", "")
end

local function split_path(path)
    local parts = {}
    for part in string.gmatch(path, "[^/]+") do
        table.insert(parts, part)
    end
    return parts
end

local function join_paths(base, relative)
    local base_parts = split_path(base)
    table.remove(base_parts)
    local relative_parts = split_path(relative)

    for _, part in ipairs(relative_parts) do
        if part == ".." then
            if #base_parts > 0 then
                table.remove(base_parts)
            end
        elseif part ~= "." then
            table.insert(base_parts, part)
        end
    end

    return "/" .. table.concat(base_parts, "/")
end

return {
    open_file_in_new_buffer = open_file_in_new_buffer,
    normalize_path = normalize_path,
    get_path_from_import_line = get_path_from_import_line,
    split_path = split_path,
    join_paths = join_paths,
}
