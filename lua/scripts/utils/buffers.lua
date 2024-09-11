local function get_current_buffer_index()
    local buffer_index = vim.api.nvim_get_current_buf()
    if buffer_index == -1 then
        return nil
    end
    return buffer_index
end

local function get_current_buffer_content()
    local buffer_index = get_current_buffer_index()
    if buffer_index == nil then
        return nil
    end
    local content = vim.api.nvim_buf_get_lines(buffer_index, 0, -1, false)
    return content
end

local function move_cursor_in_current_window(line_index, column_index)
    line_index = line_index or 0
    column_index = column_index or 0
    local buffer_index = get_current_buffer_index()
    if buffer_index == nil then
        return nil
    end
    vim.api.nvim_win_set_cursor(0, { line_index, column_index })
end

local function get_current_word()
    return vim.fn.expand("<cword>")
end

local function get_current_line_index()
    -- return vim.api.nvim_win_get_cursor(0)[1]
end

local function get_current_buffet_path()
    local filepath = vim.api.nvim_buf_get_name(0)
    -- local cwd = vim.fn.getcwd()
    -- local start_index = filepath:find(cwd, 1, true)
    -- local relative_path = filepath
    -- if start_index then
    --     relative_path = filepath:sub(start_index + #cwd)
    -- end
    -- return relative_path
    return filepath
end

local function get_current_buffer_name()
    return vim.fn.expand("%:t")
end

return {
    get_current_buffer_index = get_current_buffer_index,
    get_current_buffer_content = get_current_buffer_content,
    get_current_word = get_current_word,
    move_cursor_in_current_window = move_cursor_in_current_window,
    get_current_line_index = get_current_line_index,
    get_current_buffet_path = get_current_buffet_path,
    get_current_buffer_name = get_current_buffer_name,
}
