-- https://www.reddit.com/r/neovim/comments/td4yk1/search_buffer_from_lua/
local buffers_utils = require("scripts.utils.buffers")
local string_utils = require("scripts.utils.string")
local vue_tools = require("scripts.vue-tools.init")

local function SmartFind()
    local current_filetype = vim.bo.filetype
    local current_word = string_utils.trim(buffers_utils.get_current_word())
    local current_line_index = buffers_utils.get_current_line_index()
    local current_buffer_content = buffers_utils.get_current_buffer_content()
    if current_buffer_content == nil then
        -- TODO
        return
    end
    local current_line = current_buffer_content[current_line_index];
    local is_filetype_vue = current_filetype == "vue"
    local is_filetype_js = current_filetype == "js"
    local is_filetype_css = current_filetype == "css" or current_filetype == "scss" or current_filetype == "sass"

    if is_filetype_vue then
        local is_vue3 = vue_tools.is_vue3(current_buffer_content)
        if (is_vue3) then
            vim.lsp.buf.definition()
        else
            vue_tools.smart_definition(current_word, current_line, current_line_index, current_buffer_content)
        end
        return
    end


    if is_filetype_js then
        -- TODO
        vim.lsp.buf.definition()
        return
    end


    if is_filetype_css then
        -- TOOD
        return
    end

    vim.lsp.buf.definition()
end

vim.api.nvim_create_user_command("SmartFind", SmartFind, {})
