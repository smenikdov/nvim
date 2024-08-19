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
    local path = line:match('import%s+.-%s+from%s+["\'](.-)["\']')
    if ~path then
        return nil
    end

    return path
end

return {
    open_file_in_new_buffer = open_file_in_new_buffer,
    normalize_path = normalize_path,
    get_path_from_import_line = get_path_from_import_line,
}
