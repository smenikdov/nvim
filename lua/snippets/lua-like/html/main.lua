local ls = require("luasnip")
local su = require("snippets.lua-like.utils")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local tag = su.tag
local one_tag = su.one_tag

local prefix = "<"

local snippets = {
    {
        name = "doctype",
        desc = "Defines a template for a html5 document",
        body = fmt(
            [[
            <!DOCTYPE html>
            <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>{title}</title>
                </head>
                <body>
                    {content}
                </body>
            </html>
            ]],
            {
                content = i(1),
                title = i(2, "title"),
            }
        ),
    },
    {
        name = "a",
        desc = "HTML - Defines a hyperlink",
        body = tag("a", { "href" }),
    },
    {
        name = "abbr",
        desc = "HTML - Defines an abbreviation",
        body = tag("abbr", { "title" }),
    },
    {
        name = "address",
        desc = "HTML - Defines an address element",
    },
    {
        name = "area",
        desc = "HTML - Defines an area inside an image map",
        body = one_tag("area", { "shape", "coords", "href", "alt" }),
    },
    {
        name = "article",
        desc = "HTML - Defines an article",
    },
    {
        name = "aside",
        desc = "HTML - Defines content aside from the page content",
    },
    {
        name = "audio",
        desc = "HTML - Defines sounds content",
    },
    {
        name = "b",
        desc = "HTML - Defines bold text",
    },
    {
        name = "base",
        desc = "HTML - Defines a base URL for all the links in a page",
        body = one_tag("base", { "href", "target" }),
    },
    {
        name = "bdi",
        desc = "HTML - Used to isolate text that is of unknown directionality",
    },
    {
        name = "bdo",
        desc = "HTML - Defines the direction of text display",
        body = tag("bdo", { "dir" }),
    },
    {
        name = "big",
        desc = "HTML - Used to make text bigger",
    },
    {
        name = "blockquote",
        desc = "HTML - Defines a long quotation",
        body = tag("blockquote", { "cite" }),
    },
    {
        name = "body",
        desc = "HTML - Defines the body element",
    },
    {
        name = "br",
        desc = "HTML - Inserts a single line break",
        body = one_tag("br"),
    },
    {
        name = "button",
        desc = "HTML - Defines a push button",
        body = tag("button", { "type" }),
    },
    {
        name = "canvas",
        desc = "HTML - Defines graphics",
    },
    {
        name = "caption",
        desc = "HTML - Defines a table caption",
    },
    {
        name = "cite",
        desc = "HTML - Defines a citation",
    },
    {
        name = "code",
        desc = "HTML - Defines computer code text",
    },
    {
        name = "col",
        desc = "HTML - Defines attributes for table columns",
        body = one_tag("col"),
    },
    {
        name = "colgroup",
        desc = "HTML - Defines group of table columns",
    },
    {
        name = "command",
        desc = "HTML - Defines a command button [not supported]",
    },
    {
        name = "datalist",
        desc = "HTML - Defines a dropdown list",
    },
    {
        name = "dd",
        desc = "HTML - Defines a definition description",
    },
    {
        name = "del",
        desc = "HTML - Defines deleted text",
    },
    {
        name = "details",
        desc = "HTML - Defines details of an element",
    },
    {
        name = "dialog",
        desc = "HTML - Defines a dialog (conversation)",
    },
    {
        name = "dfn",
        desc = "HTML - Defines a definition term",
    },
    {
        name = "div",
        desc = "HTML - Defines a section in a document",
    },
    {
        name = "dl",
        desc = "HTML - Defines a definition list",
    },
    {
        name = "dt",
        desc = "HTML - Defines a definition term",
    },
    {
        name = "em",
        desc = "HTML - Defines emphasized text",
    },
    {
        name = "embed",
        desc = "HTML - Defines external interactive content ot plugin",
        body = one_tag("embed", { "src" }),
    },
    {
        name = "fieldset",
        desc = "HTML - Defines a fieldset",
    },
    {
        name = "figcaption",
        desc = "HTML - Defines a caption for a figure",
    },
    {
        name = "figure",
        desc = "HTML - Defines a group of media content, and their caption",
    },
    {
        name = "footer",
        desc = "HTML - Defines a footer for a section or page",
    },
    {
        name = "form",
        desc = "HTML - Defines a form",
    },
    {
        name = "h1",
        desc = "HTML - Defines header 1",
    },
    {
        name = "h2",
        desc = "HTML - Defines header 2",
    },
    {
        name = "h3",
        desc = "HTML - Defines header 3",
    },
    {
        name = "h4",
        desc = "HTML - Defines header 4",
    },
    {
        name = "h5",
        desc = "HTML - Defines header 5",
    },
    {
        name = "h6",
        desc = "HTML - Defines header 6",
    },
    {
        name = "head",
        desc = "HTML - Defines information about the document",
    },
    {
        name = "header",
        desc = "HTML - Defines a header for a section of page",
    },
    {
        name = "hgroup",
        desc = "HTML - Defines information about a section in a document",
    },
    {
        name = "hr",
        desc = "HTML - Defines a horizontal rule",
        body = one_tag("hr"),
    },
    {
        name = "html",
        desc = "HTML - Defines an html document",
    },
    {
        name = "i",
        desc = "HTML - Defines italic text",
    },
    {
        name = "iframe",
        desc = "HTML - Defines an inline sub window",
        body = tag("iframe", { "src" }),
    },
    {
        name = "img",
        desc = "HTML - Defines an image",
        body = one_tag("img", { "src", "alt" }),
    },
    {
        name = "input",
        desc = "HTML - Defines an input field",
        body = one_tag("input", { "type" }),
    },
    {
        name = "ins",
        desc = "HTML - Defines inserted text",
    },
    {
        name = "keygen",
        desc = "HTML - Defines a generated key in a form",
        body = one_tag("keygen", { "name" }),
    },
    {
        name = "kbd",
        desc = "HTML - Defines keyboard text",
    },
    {
        name = "label",
        desc = "HTML - Defines an inline window",
    },
    {
        name = "legend",
        desc = "HTML - Defines a title in a fieldset",
    },
    {
        name = "li",
        desc = "HTML - Defines a list item",
    },
    {
        name = "link",
        desc = "HTML - Defines a resource reference",
        body = one_tag("link", { "rel", "type", "href" }),
    },
    {
        name = "main",
        desc = "HTML - Defines an image map",
    },
    {
        name = "map",
        desc = "HTML - Defines an image map",
        body = tag("map", { "name" }),
    },
    {
        name = "mark",
        desc = "HTML - Defines marked text",
    },
    {
        name = "menu",
        desc = "HTML - Defines a menu list",
    },
    {
        name = "menuitem",
        desc = "HTML - Defines a menu item [firefox only]",
    },
    {
        name = "meta",
        desc = "HTML - Defines meta information",
        body = one_tag("meta", { "name", "content" }),
    },
    {
        name = "meter",
        desc = "HTML - Defines measurement within a predefined range",
        body = tag("meter", { "value" }),
    },
    {
        name = "nav",
        desc = "HTML - Defines navigation links",
    },
    {
        name = "noscript",
        desc = "HTML - Defines a noscript section",
    },
    {
        name = "object",
        desc = "HTML - Defines an embedded object",
        body = tag("object", { "width", "height", "data" }),
    },
    {
        name = "ol",
        desc = "HTML - Defines an ordered list",
    },
    {
        name = "optgroup",
        desc = "HTML - Defines an option group",
    },
    {
        name = "option",
        desc = "HTML - Defines an option in a drop-down list",
        body = tag("option", { "value" }),
    },
    {
        name = "output",
        desc = "HTML - Defines some types of output",
        body = tag("output", { "name", "for" }),
    },
    {
        name = "p",
        desc = "HTML - Defines a paragraph",
    },
    {
        name = "param",
        desc = "HTML - Defines a parameter for an object",
        body = one_tag("param", { "name", "value" }),
    },
    {
        name = "pre",
        desc = "HTML - Defines preformatted text",
    },
    {
        name = "progress",
        desc = "HTML - Defines progress of a task of any kind",
        body = tag("progress", { "value", "max" }),
    },
    {
        name = "q",
        desc = "HTML - Defines a short quotation",
    },
    {
        name = "rp",
        desc = "HTML - Used in ruby annotations to define what to show browsers that do not support the ruby element",
    },
    {
        name = "rt",
        desc = "HTML - Defines explanation to ruby annotations",
    },
    {
        name = "ruby",
        desc = "HTML - Defines ruby annotations",
    },
    {
        name = "s",
        desc = "HTML - Used to define strikethrough text",
    },
    {
        name = "samp",
        desc = "HTML - Defines sample computer code",
    },
    {
        name = "script",
        desc = "HTML - Defines a script",
    },
    {
        name = "section",
        desc = "HTML - Defines a section",
    },
    {
        name = "select",
        desc = "HTML - Defines a selectable list",
    },
    {
        name = "small",
        desc = "HTML - Defines small text",
    },
    {
        name = "source",
        desc = "HTML - Defines media resource",
        body = one_tag("source", { "src", "type" }),
    },
    {
        name = "span",
        desc = "HTML - Defines a section in a document",
    },
    {
        name = "strong",
        desc = "HTML - Defines strong text",
    },
    {
        name = "style",
        desc = "HTML - Defines a style definition",
    },
    {
        name = "sub",
        desc = "HTML - Defines sub-scripted text",
    },
    {
        name = "sup",
        desc = "HTML - Defines super-scripted text",
    },
    {
        name = "summary",
        desc = "HTML - Defines a visible heading for the detail element [limited support]",
    },
    {
        name = "table",
        desc = "HTML - Defines a table",
    },
    {
        name = "tbody",
        desc = "HTML - Defines a table body",
    },
    {
        name = "td",
        desc = "HTML - Defines a table cell",
    },
    {
        name = "textarea",
        desc = "HTML - Defines a text area",
        body = tag("textarea", { "rows", "cols" }),
    },
    {
        name = "tfoot",
        desc = "HTML - Defines a table footer",
    },
    {
        name = "thead",
        desc = "HTML - Defines a table head",
    },
    {
        name = "th",
        desc = "HTML - Defines a table header",
    },
    {
        name = "time",
        desc = "HTML - Defines a date/time",
        body = tag("time", { "datetime" }),
    },
    {
        name = "title",
        desc = "HTML - Defines the document title",
    },
    {
        name = "tr",
        desc = "HTML - Defines a table row",
    },
    {
        name = "track",
        desc = "HTML - Defines a table row",
        body = one_tag("track", { "src", "kind", "srclang", "label" }),
    },
    {
        name = "u",
        desc = "HTML - Used to define underlined text",
    },
    {
        name = "ul",
        desc = "HTML - Defines an unordered list",
    },
    {
        name = "var",
        desc = "HTML - Defines a variable",
    },
    {
        name = "video",
        desc = "HTML - Defines a video",
        body = tag("video"),
    },
}


local luasnip_snippets = {}
for i, snippet in pairs(snippets) do
    table.insert(luasnip_snippets, s({
        trig = prefix .. snippet.name,
        name = snippet.name,
        desc = snippet.desc,
        show_condition = su.check_prefix(prefix),
    }, snippet.body or su.tag(snippet.name)))
end

ls.add_snippets("html", luasnip_snippets)
ls.add_snippets("vue",  luasnip_snippets)
