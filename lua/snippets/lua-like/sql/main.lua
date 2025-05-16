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

-- s select
-- d delete
-- u update
-- i insert
--
-- + drop alert create grant

local code_place = "// TODO";

local snippets = {
    { "s", group = "Select" },

    {
        name = "Select",
        trig = "ss",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table") }
        ),
    },
    {
        name = "Select Limit",
        trig = "sl",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            LIMIT {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "1") }
        ),
    },
    {
        name = "Select Limit Offset",
        trig = "slO",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            LIMIT {}
            OFFSET {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "1"), i(5, "1") }
        ),
    },
    {
        name = "Select Where",
        trig = "sw",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            WHERE {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "condition") }
        ),
    },
    {
        name = "Select Where Order",
        trig = "swo",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            WHERE {}
            ORDER BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "condition"), i(5, "field") }
        ),
    },
    {
        name = "Select Where Limit",
        trig = "swl",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            WHERE {}
            LIMIT {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "condition"), i(5, "1") }
        ),
    },
    {
        name = "Select Where Limit Offset",
        trig = "swlO",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            WHERE {}
            LIMIT {}
            OFFSET {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "condition"), i(5, "1"), i(6, "1") }
        ),
    },
    {
        name = "Select Where Group By",
        trig = "swg",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            WHERE {}
            GROUP BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "condition"), i(5, "field") }
        ),
    },
    {
        name = "Select Where Group By Having",
        trig = "swgh",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            WHERE {}
            GROUP BY "{}"
            HAVING {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "condition"), i(5, "field"), i(6, "condition") }
        ),
    },
    {
        name = "Select Group By",
        trig = "sg",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            GROUP BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "field") }
        ),
    },
    {
        name = "Select Group By Having",
        trig = "sgh",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            GROUP BY "{}"
            HAVING {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "field"), i(5, "condition") }
        ),
    },
    {
        name = "Select Order",
        trig = "so",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            ORDER BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "field") }
        ),
    },
    {
        name = "Select Offset",
        trig = "sO",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            OFFSET {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "1") }
        ),
    },
    {
        name = "Select Join",
        trig = "sj",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table") }
        ),
    },
    {
        name = "Select Join Where",
        trig = "sjw",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            WHERE {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "condition") }
        ),
    },
    {
        name = "Select Join Where Order",
        trig = "sjwo",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            WHERE {}
            ORDER BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "condition"), i(6, "field") }
        ),
    },
    {
        name = "Select Join Where Limit",
        trig = "sjwl",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            WHERE {}
            LIMIT {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "condition"), i(6, "1") }
        ),
    },
    {
        name = "Select Join Where Limit Offset",
        trig = "sjwlO",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            WHERE {}
            LIMIT {}
            OFFSET {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "condition"), i(6, "1"), i(7, "1") }
        ),
    },
    {
        name = "Select Join Where Group By",
        trig = "sjwg",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            WHERE {}
            GROUP BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "condition"), i(6, "field") }
        ),
    },
    {
        name = "Select Join Where Group By Having",
        trig = "sjwgh",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            WHERE {}
            GROUP BY "{}"
            HAVING {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "condition"), i(6, "field"), i(7, "condition") }
        ),
    },
    {
        name = "Select Join Limit",
        trig = "sjl",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            LIMIT {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "1") }
        ),
    },
    {
        name = "Select Join Limit Offset",
        trig = "sjlO",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            LIMIT {}
            OFFSET {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "1"), i(6, "1") }
        ),
    },
    {
        name = "Select Join Grup By",
        trig = "sjg",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            GROUP BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "field") }
        ),
    },
    {
        name = "Select Join Grup By Having",
        trig = "sjg",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            GROUP BY "{}"
            HAVING {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "field"), i(6, "condition") }
        ),
    },
    {
        name = "Select Join Order",
        trig = "sjo",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            ORDER BY "{}"
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "field") }
        ),
    },
    {
        name = "Select Join Offset",
        trig = "sjO",
        body = fmt(
            [[
            SELECT "{}"
                 , "{}"
            FROM {}
            INNER JOIN {}
            OFFSET {}
            ]],
            { i(1, "field"), i(2, "field"), i(3, "table"), i(4, "table"), i(5, "1") }
        ),
    },

    { "i", group = "Insert" },

    {
        name = "Insert",
        trig = "ii",
        body = fmt(
            [[
            INSERT INTO {} ("{}")
            VALUES ({})
            ]],
            { i(1, "table"), i(2, "field"), i(3, "value") }
        ),
    },
    {
        name = "Insert Returning",
        trig = "ir",
        body = fmt(
            [[
            INSERT INTO {} ("{}")
            VALUES ({})
            RETURNING "{}"
            ]],
            { i(1, "table"), i(2, "field"), i(3, "value"), i(4, "field") }
        ),
    },

    { "u", group = "Update" },

    {
        name = "Update",
        trig = "uu",
        body = fmt(
            [[
            UPDATE {}
            SET "{}" = $1,
                "{}" = $2
            ]],
            { i(1, "table"), i(2, "field"), i(3, "field") }
        ),
    },
    {
        name = "Update Where",
        trig = "uw",
        body = fmt(
            [[
            UPDATE {}
            SET "{}" = $2,
                "{}" = $3
            WHERE "{}" = $1
            ]],
            { i(1, "table"), i(2, "field"), i(3, "field"), i(4, "field") }
        ),
    },
    {
        name = "Update Where Returning",
        trig = "uwr",
        body = fmt(
            [[
            UPDATE {}
            SET "{}" = $2,
                "{}" = $3
            WHERE "{}" = $1
            RETURNING "{}"
            ]],
            { i(1, "table"), i(2, "field"), i(3, "field"), i(4, "field"), i(5, "field") }
        ),
    },

    { "u", group = "Update" },

    {
        name = "Delete",
        trig = "dd",
        body = fmt(
            [[
            DELETE
            FROM {}
            ]],
            { i(1, "table") }
        ),
    },
    {
        name = "Delete Where",
        trig = "dw",
        body = fmt(
            [[
            DELETE
            FROM {}
            WHERE "{}" = $1
            ]],
            { i(1, "table"), i(2, "condition") }
        ),
    },
    {
        name = "Delete Where Returning",
        trig = "dwr",
        body = fmt(
            [[
            DELETE
            FROM {}
            WHERE "{}" = $1
            RETURNING "{}"
            ]],
            { i(1, "table"), i(2, "condition"), i(3, "field") }
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

ls.add_snippets("sql",  luasnip_snippets)

