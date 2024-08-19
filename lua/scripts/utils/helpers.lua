local function open_url(url)
    local cmd = string.format("xdg-open '%s'", url)
    os.execute(cmd)
end

return {
    open_url = open_url,
}
