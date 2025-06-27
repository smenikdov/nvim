return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp", -- Интеграция с LSP для отображения ошибок
                show_buffer_close_icons = false,
                show_close_icon = false,
                close_command = "CloseBuffer",
                separator_style = "squre",
                color_icons = true,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "VDELO.DEV",
                        text_align = "right",
                        separator = true,
                    },
                },
                name_formatter = function(buf)
                    if buf.name == "[No Name]" then
                        return ""
                    end
                    return buf.name
                end
            },
        })

        function close_empty_unnamed_buffers()
            -- Get a list of all buffers
            local buffers = vim.api.nvim_list_bufs()

            -- Iterate over each buffer
            for _, bufnr in ipairs(buffers) do
                -- Check if the buffer is empty and doesn't have a name
                if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_name(bufnr) == '' and
                    vim.api.nvim_buf_get_option(bufnr, 'buftype') == '' then

                    -- Get all lines in the buffer
                    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

                    -- Initialize a variable to store the total number of characters
                    local total_characters = 0

                    -- Iterate over each line and calculate the number of characters
                    for _, line in ipairs(lines) do
                        total_characters = total_characters + #line
                    end


                    -- Close the buffer if it's empty:
                    if total_characters == 0 then

                        vim.api.nvim_buf_delete(bufnr, {
                            force = true
                        })
                    end
                end
            end
        end

        vim.api.nvim_create_autocmd("BufReadPost", {
            callback = close_empty_unnamed_buffers,
        })
    end,
}
