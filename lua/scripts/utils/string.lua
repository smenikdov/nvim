local function is_pascal_case(word)
    return word:match("^([A-Z][a-z]+)+$")
end

return {
    is_pascal_case = is_pascal_case,
}
