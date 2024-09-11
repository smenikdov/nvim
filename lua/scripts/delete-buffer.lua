local function CloseBuffer(buffer_index, opts)
    local open_buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local count = #open_buffers

    if opts.save then
        vim.cmd("w")
    end
    if count > 1 then
        vim.cmd("bnext")
    end
    if opts.save then
        vim.cmd("bdelete " .. buffer_index)
    else
        vim.cmd("bdelete! " .. buffer_index)
    end
    -- if count <= 1 then
    --     vim.cmd("q")
    -- end
end

local function CloseBufferWithPrompt()
    local buffer_index = vim.api.nvim_get_current_buf()

    if buffer_index == -1 then
        print("No active buffer found.")
        return
    end

    if vim.api.nvim_buf_get_option(buffer_index, "modified") then
        local choice = vim.fn.confirm("Save changes?", "&Save\n&Discard\n&Cancel")

        if choice == 1 then
            CloseBuffer(buffer_index, { save = true })
        elseif choice == 2 then
            CloseBuffer(buffer_index, { save = false })
        else
            print("Action canceled")
        end
    else
        CloseBuffer(buffer_index, { save = false })
    end
end

vim.api.nvim_create_user_command("CloseBuffer", CloseBufferWithPrompt, {})
