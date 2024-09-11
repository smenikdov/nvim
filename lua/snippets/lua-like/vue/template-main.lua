
local ls = require("luasnip")
local su = require("snippets.lua-like.utils")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local tag = su.tag
local one_tag = su.one_tag

local subprefix = "<"

local snippets = {
    {
        name = "Transition",
        desc = "Provides animated transition effects to a single element or component.",
    },
    {
        name = "TransitionGroup",
        desc = "Provides transition effects for multiple elements or components in a list.",
    },
}


local luasnip_snippets = {}
for i, snippet in pairs(snippets) do
    table.insert(luasnip_snippets, s({
        trig = subprefix .. snippet.name,
        name = snippet.name,
        desc = snippet.desc,
    }, snippet.body or su.tag(snippet.name)))
end

ls.add_snippets("vue", luasnip_snippets)
