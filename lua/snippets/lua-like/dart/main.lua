local ls = require("luasnip")
local su = require("snippets.lua-like.utils")
local _utils = require("snippets.lua-like.utils")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local buffers_utils = require("scripts.utils.buffers")

local code_place = "// TODO";

local snippets = {
    { "c", group = "Create" },
    {
        name = "Create If",
        trig = "ci",
        body = fmt(
            "if ({}) {{\n\t{}\n}}",
            { i(1, "true"), i(2, code_place)
        }),
    },
    {
        name = "Create If Else",
        trig = "cie",
        body = fmt(
            "if ({}) {{\n\t{}\n}} else {{\n\t{}\n}}",
            { i(1, "true"), i(2, code_place), i(3, code_place)
        }),
    },
    {
        name = "Create If Else If",
        trig = "ciei",
        body = fmt(
            "if ({}) {{\n\t{}\n}} else if ({}) {{\n\t{}\n}}",
            { i(1, "true"), i(2, code_place), i(3, "true"), i(4, code_place)
        }),
    },
    {
        name = "Create Else",
        trig = "ce",
        body = fmt(
            "else {{\n\t{}\n}}",
            { i(1, code_place)
        }),
    },
    {
        name = "Create Else If",
        trig = "cei",
        body = fmt(
            "else if ({}) {{\n\t{}\n}}",
            { i(1, "true"), i(2, code_place)
        }),
    },
    {
        name = "Create For In",
        trig = "cfi",
        body = fmt(
            "for (let {} in {}) {{\n\t{}\n}}",
            { i(1, "key"), i(2, "object"), i(3, code_place) }
        ),
    },
    {
        name = "Create While",
        trig = "cw",
        body = fmt(
            "while ({}) {{\n\t{}\n}}",
            { i(1, "true"), i(2, code_place) }
        ),
    },
}


local luasnip_snippets = {}
for i, snippet in pairs(snippets) do
    if not snippet.group then
        table.insert(luasnip_snippets, s({
            trig = snippet.trig,
            name = snippet.name,
            desc = "",
        }, snippet.body))
    end
end

ls.add_snippets("dart", luasnip_snippets)
