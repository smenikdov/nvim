local function open_url(url)
    vim.fn.system("firefox " .. url)
end

local function open_url_with_confirm(url)
    local choice = vim.fn.confirm("Open url " .. url .. "?", "&Yes\n&No")

    if choice == 1 then
        open_url(url)
    else
        print("Action canceled")
    end
end

return {
    open_url = open_url,
    open_url_with_confirm = open_url_with_confirm,
}
