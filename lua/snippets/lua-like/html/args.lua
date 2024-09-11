
local ls = require("luasnip")
local su = require("snippets.lua-like.utils")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local attr = su.attr

local prefix = ":"

local snippets = {
    {
        name = "href",
    },
}


local luasnip_snippets = {}
for i, snippet in pairs(snippets) do
    table.insert(luasnip_snippets, s({
        trig = prefix .. snippet.name,
        name = snippet.name,
        desc = snippet.desc,
    }, snippet.body or su.attr(snippet.name)))
end

ls.add_snippets("html", luasnip_snippets)
