local function get_language()
    if (vim.opt.iminsert._value == 0) then
        return "en"
    else
        return "ru"
    end
end


local function toggle_language_n()
    if (vim.opt.iminsert._value == 0) then
        vim.opt.iminsert = 1
        vim.opt.imsearch = 1
    else
        vim.opt.iminsert = 0
        vim.opt.imsearch = 0
    end
    -- print(get_language())
end

local function toggle_language_i()
    local keys = vim.api.nvim_replace_termcodes("<C-^>", true, false, true)
    vim.api.nvim_feedkeys(keys, 'm', false)
    if vim.opt.imsearch._value == 0 then
        vim.opt.imsearch = 1
    else
        vim.opt.imsearch = 0
    end
    -- print(get_language())
end

local function toggle_language_c()
    local keys = vim.api.nvim_replace_termcodes("<C-^>", true, false, true)
    vim.api.nvim_feedkeys(keys, 'm', false)
    if vim.opt.iminsert._value == 0 then
        vim.opt.iminsert = 1
    else
        vim.opt.iminsert = 0
    end
    -- print(get_language())
end

local function setup()
    vim.api.nvim_command("set keymap=russian-jcukenwin")
    vim.opt.iminsert = 0
    vim.opt.imsearch = 0
    vim.api.nvim_command("highlight lCursor guifg=NONE guibg=Cyan")
    vim.opt.spell = true
    vim.opt.spelllang = "ru_yo,en_us"
end

return {
    toggle_language_c = toggle_language_c,
    toggle_language_n = toggle_language_n,
    toggle_language_i = toggle_language_i,
    get_language = get_language,
    setup = setup,
}
