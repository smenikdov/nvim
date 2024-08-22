-- local function is_pascal_case(word)
--     return string.find(word, "^([A-Z][a-z]+)+$")
-- end
--

local function trim(s)
    return string.gsub(s, "^%s*(.-)%s*$", "%1")
end

return {
    -- is_pascal_case = is_pascal_case,
    trim = trim,
}
