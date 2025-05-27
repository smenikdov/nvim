local M = {}

function M.run_sgpt(cmd, filetype)
    local buf = vim.api.nvim_create_buf(true, false)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()

    result = result:gsub("^%s*(.-)%s*$", "%1")
    local lines = vim.split(result, "\n", { plain = true, trimempty = true })

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_buf_set_option(buf, 'filetype', filetype)

    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile') -- не привязан к файлу
    -- vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe') -- удаляется при закрытии

    vim.api.nvim_set_current_buf(buf)
end

function M.ask_sgpt()
    vim.ui.input(
        { prompt = "Sgpt" },
        function(query)
            if query then
                local cmd = string.format('sgpt --no-md "%s"', vim.fn.shellescape(query))
                M.run_sgpt(cmd, 'markdown')
            end
        end
    )
end

function M.ask_sgpt_selection()
    local start_pos = vim.api.nvim_buf_get_mark(0, "<")
    local end_pos = vim.api.nvim_buf_get_mark(0, ">")

    local lines = vim.api.nvim_buf_get_lines(0, start_pos[1] - 1, end_pos[1], false)

    if #lines == 1 then
        lines[1] = string.sub(lines[1], start_pos[2] + 1, end_pos[2])
    else
        lines[1] = string.sub(lines[1], start_pos[2] + 1)
        if #lines > 1 then
            lines[#lines] = string.sub(lines[#lines], 1, end_pos[2])
        end
    end

    local selected_text = table.concat(lines, "\n")

    vim.ui.input(
        { prompt = "Sgpt" },
        function(text)
            if text then
                local query = text .. "\n" .. selected_text
                local cmd = string.format('sgpt --no-md "%s"', vim.fn.shellescape(query:gsub('"', '\\"')))
                M.run_sgpt(cmd, 'markdown')
            end
        end
    )
end


vim.api.nvim_create_user_command("SgptAsk", M.ask_sgpt, { nargs = 0})
vim.api.nvim_create_user_command("SgptAskSelection", M.ask_sgpt_selection, { range = true })

return M
