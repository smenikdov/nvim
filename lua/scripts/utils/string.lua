-- local function is_pascal_case(word)
--     return string.find(word, "^([A-Z][a-z]+)+$")
-- end
--

local function trim(s)
    return string.gsub(s, "^%s*(.-)%s*$", "%1")
end

local function ends_with(str, ending)
    return ending == "" or string.sub(str, -string.len(ending)) == ending
end

return {
    -- is_pascal_case = is_pascal_case,
    trim = trim,
    ends_with = ends_with,
}
