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

-- d declare
-- c create
-- l log
-- t this
-- e export
-- i import
-- k keywords

local code_place = "// TODO";

local snippets = {
    { "d", group = "Declare" },
    {
        name = "Declare Let Object",
        trig = "dlo",
        body = fmt("let {} = {{\n\t{}\n}}", { i(1, "name"), i(2) }),
    },
    {
        name = "Declare Let Array",
        trig = "dla",
        body = fmt("let {} = [\n\t{}\n]", { i(1, "name"), i(2) }),
    },
    {
        name = "Declare Let Function",
        trig = "dlf",
        body = fmt(
            "let {} = ({}) => {{\n\t{}\n}}",
            { i(1, "name"), i(2), i(3, code_place) }
        ),
    },
    {
        name = "Declare Let Function Async",
        trig = "dcfa",
        body = fmt(
            "let {} = async ({}) => {{\n\t{}\n}}",
            { i(1, "name"), i(2), i(3, code_place) }
        ),
    },
    {
        name = "Declare Let Ternary",
        trig = "dlt",
        body = fmt(
            "let {} = {} ? {} : {}",
            { i(1, "name"), i(2, "cond"), i(3, "true"), i(4, "false") }
        ),
    },
    {
        name = "Declare Const Object",
        trig = "dco",
        body = fmt(
            "const {} = {{\n}};",
            { i(1, "name") }
        ),
    },
    {
        name = "Declare Const Array",
        trig = "dca",
        body = fmt(
            "const {} = [\n];",
            { i(1, "name") }
        ),
    },
    {
        name = "Declare Const Function",
        trig = "dcf",
        body = fmt(
            "const {} = ({}) => {{\n\t{}\n}}",
            { i(1, "name"), i(2), i(3, code_place) }
        ),
    },
    {
        name = "Declare Const Function Async",
        trig = "dcfa",
        body = fmt(
            "const {} = async ({}) => {{\n\t{}\n}}",
            { i(1, "name"), i(2), i(3, code_place) }
        ),
    },
    {
        name = "Declare Const Ternary",
        trig = "dct",
        body = fmt(
            "const {} = {} ? {} : {}",
            { i(1, "name"), i(2, "cond"), i(3, "true"), i(4, "false") }
        ),
    },
    {
        name = "Declare Function",
        trig = "df",
        body = fmt("function {} ({}) {{\n}}", { i(1, "name"), i(2) }),
    },
    {
        name = "Declare Function Async",
        trig = "dfa",
        body = fmt(
            "async function {} ({}) {{\n}}",
            { i(1, "name"), i(2) }
        ),
    },
    {
        name = "Declare Method",
        trig = "dm",
        body = fmt(
            "{}({}) {{\n}},",
            { i(1, "name"), i(2) }
        ),
    },
    {
        name = "Declare Method Async",
        trig = "dma",
        body = fmt(
            "async {}({}) {{\n}},",
            { i(1, "name"), i(2) }
        ),
    },
    {
        name = "Declare Method Async Request",
        trig = "dmar",
        body = fmt(
            [[
            async {}({}) {{
                try {{
                    const request = {{
                    }};
                    const response = await this.$api.{}(request);
                    const data = response.data;
                }}
                catch (error) {{
                    console.log('{}');
                    console.log(error);
                    this.$error('Ошибка при {}. Попробуйте позже или обратитесь в техподдержку.');
                }}
            }},
            ]],
            { i(1, "name"), i(2), i(3, "TODO"), i(4, "ERROR"), i(5) }
        ),
    },
    -- {
    --     name = "Declare Handler",
    --     trig = "dh",
    --     body = fmt(
    --         [[
    --         ]],
    --         { i(1, "name"), i(2), i(3), i(4, "TODO") }
    --     ),
    -- },
    {
        name = "Declare Point",
        trig = "dp",
        body = fmt(
            [[
            fastify.route({{
                method: 'POST',
                url: '/{}',
                schema: {{
                    body: {{
                        type: 'object',
                        properties: {{{}}},
                        required: [{}],
                    }},
                    response: {{
                        400: {{
                            type: 'object',
                            properties: {{
                                message: {{ type: 'string' }},
                                statusCode: {{ type: 'integer' }},
                            }},
                        }},
                    }},
                }},
                async handler (request, reply) {{
                    const data = await {}(request.body);

                    if (data.statusCode !== 200) {{
                        reply.code(400);
                    }}
                    
                    reply.send(data);
                }},
            }});
            ]],
            { i(1, "name"), i(2), i(3), i(4, "TODO") }
        ),
    },

    { "l", group = "Log" },
    {
        name = "Log",
        trig = "ll",
        body = fmt("console.log({});", { i(1) }),
    },
    {
        name = "Log Error",
        trig = "le",
        body = fmt("console.error({});", { i(1) }),
    },
    {
        name = "Log Warn",
        trig = "lw",
        body = fmt("console.warn({});", { i(1) }),
    },
    {
        name = "Log Dir",
        trig = "ld",
        body = fmt("console.dir('{}:', {});", { i(1), rep(1) }),
    },
    {
        name = "Log Table",
        trig = "lt",
        body = fmt("console.table({});", { i(1) }),
    },


    { "i", group = "Import" },
    {
        name = "Import Package",
        trig = "ip",
        body = fmt("import {} from '{}';", { i(1, "name"), i(2, "module") }),
    },
    {
        name = "Import Package As",
        trig = "ipa",
        body = fmt(
            "import {} as {} from '{}';",
            { i(1, "name"), i(2, "name"), i(3, "module") }
        ),
    },
    {
        name = "Import Component",
        trig = "ic",
        body = fmt("import {} from 'components/{}.vue';", { i(1, "name"), rep(1) }),
    },
    {
        name = "Import Mixin",
        trig = "im",
        body = fmt("import {} from 'src/mixins/{}.js';", { i(1, "name"), rep(1) }),
    },


    { "e", group = "Export" },
    {
        name = "Export Default",
        trig = "ed",
        body = fmt("export default {}", { i(1) }),
    },
    {
        name = "Export Const",
        trig = "ec",
        body = fmt("export const {} = {}", { i(1, "name"), i(2) }),
    },
    {
        name = "Export Function",
        trig = "ef",
        body = fmt(
            "export function {} ({}) {{\n\t{}\n}}",
            { i(1, "name"), i(2), i(3, code_place) }
        ),
    },

    { "c", group = "Create" },
    {
        name = "Create If",
        trig = "ci",
        body = fmt(
            "if ({}) {{\n}}",
            { i(1, "true")
        }),
    },
    {
        name = "Create If Else",
        trig = "cie",
        body = fmt(
            "if ({}) {{\n}}\nelse {{\n}}",
            { i(1, "true")
        }),
    },
    {
        name = "Create If Else If",
        trig = "ciei",
        body = fmt(
            "if ({}) {{\n}}\nelse if ({}) {{\n}}",
            { i(1, "true"), i(2, "true")
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
            "else if ({}) {{\n}}",
            { i(1, "true")
        }),
    },
    {
        name = "Create Try Catch",
        trig = "ctc",
        body = fmt(
            "try {{\n\t{}\n}}\ncatch (error) {{\n}}",
            { i(1, code_place) }
        ),
    },
    {
        name = "Create Try Finally",
        trig = "ctf",
        body = fmt(
            "try {{\n\t{}\n}}\nfinally {{\n}}",
            { i(1, code_place) }
        ),
    },
    {
        name = "Create Try Catch Finally",
        trig = "ctcf",
        body = fmt(
            "try {{\n\t{}\n}}\ncatch (error) {{\n}}\nfinally {{\n}}",
            { i(1, code_place) }
        ),
    },
    {
        name = "Create For Of",
        trig = "cfo",
        body = fmt(
            "for (let {} of {}) {{\n\t{}\n}}",
            { i(1, "iterator"), i(2, "array"), i(3, code_place) }
        ),
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
    {
        name = "Create Switch",
        trig = "cs",
        body = fmt(
            "switch ({}) {{\n\tcase {}:\n\t\t{}\n\t\tbreak;\n}}",
            { i(1, "name"), i(2, "value"), i(3, code_place) }
        ),
    },


    { "t", group = "This" },
    {
        name = "This",
        trig = "t",
        body = fmt("this.", {}),
    },
    {
        name = "This Error",
        trig = "te",
        body = fmt("this.$error({});", { i(1) }),
    },
    {
        name = "This Warn",
        trig = "tw",
        body = fmt("this.$warning({});", { i(1) }),
    },
    {
        name = "This Success",
        trig = "ts",
        body = fmt("this.$success({});", { i(1) }),
    },
    {
        name = "This Info",
        trig = "ti",
        body = fmt("this.$info({});", { i(1) }),
    },
    {
        name = "This Helpers",
        trig = "th",
        body = fmt("this.$helpers.{}({});", { i(1, "name"), i(2) }),
    },
    -- {
    --     name = "This Emit",
    --     trig = "te",
    --     body = fmt("this.$emit({});", { i(1) }),
    -- },
    {
        name = "This Bus",
        trig = "tb",
        body = fmt("this.$bus.{}", { i(1) }),
    },
    {
        name = "This Bus Emit",
        trig = "tbe",
        body = fmt("this.$bus.$emit('{}');", { i(1) }),
    },
    -- off
    {
        name = "This Bus On",
        trig = "tbo",
        body = fmt("this.$bus.$on('{}', {});", { i(1), i(2) }),
    },
    {
        name = "This Constants",
        trig = "tc",
        body = fmt("this.$constants.{}", { i(1) }),
    },
    -- route router
    {
        name = "This Refs",
        trig = "tr",
        body = fmt("this.$refs.{}", { i(1) }),
    },
    {
        name = "This Store",
        trig = "ts",
        body = fmt("this.$store.{};", { i(1) }),
    },
    {
        name = "This Store Dispatch",
        trig = "tsd",
        body = fmt("this.$store.dispatch('{}');", { i(1) }),
    },
    {
        name = "This Store Getters",
        trig = "tsg",
        body = fmt("this.$store.getters.{};", { i(1) }),
    },
    {
        name = "This Store Dispatch Object",
        trig = "tsdo",
        body = fmt("this.$store.dispatch('{}', {{\n}});", { i(1) }),
    },
    {
        name = "This Store Dispatch Array",
        trig = "tsda",
        body = fmt("this.$store.dispatch('{}', [\n]);", { i(1) }),
    },
    {
        name = "This Message",
        trig = "tm",
        body = fmt("this.$message({})\n\t.onOk(async () => {{\n\t}});", { i(1, "message") }),
    },
    {
        name = "This NextTick",
        trig = "tn",
        body = fmt("this.$nextTick();{}", { i(1) }),
    },
    {
        name = "This NextTick Awaited",
        trig = "tna",
        body = fmt("await this.$nextTick();{}", { i(1) }),
    },


    { "k", group = "Keywords" },
    {
        name = "await",
        trig = "ka",
        body = fmt("await {}", { i(1) }),
    },
    {
        name = "return",
        trig = "kr",
        body = fmt("return {};", { i(1) }),
    },
    -- {
    --     name = "throw new Error",
    --     trig = "ctn",
    --     body = "throw new ${0:error}",
    -- },
}


-- local snippets = {
--     {
--         name = "await setTimeout",
--         trig = "ast",
--         body = fmt("await new Promise((r) => setTimeout(r, {}))", { i(1, "3000") }),
--     },
--     {
--         name = "process.env",
--         trig = "pe",
--         body = fmt("process.env", {}),
--     },
--     {
--         name = "addEventListener",
--         trig = "ae",
--         body = fmt(
--             "{}.addEventListener('{}', {} => {{\n\t{}\n}})",
--             { i(2, "document"), i(3, "event"), i(4, "event"), i(1) }
--         ),
--     },
--     {
--         name = "removeEventListener",
--         trig = "rel",
--         body = fmt(
--             "{}.removeEventListener('{}', {})",
--             { i(1, "document"), i(2, "event"), i(3, "listener") }
--         ),
--     },
--     {
--         name = "generate array of integers starting with 1",
--         trig = "gari",
--         body = "Array.from({ length: ${1:length} }, (v, k) => k + 1)",
--     },
--     {
--         name = "generate array of integers starting with 0",
--         trig = "gari0",
--         body = "[...Array(${1:length}).keys()]",
--     },
--     {
--         name = "class",
--         trig = "cs",
--         body = "class ${1:name} {\n\tconstructor (${2:arguments}) {\n\t\t${0}\n\t}\n}",
--     },
--     {
--         name = "class extends",
--         trig = "csx",
--         body = "class ${1:name} extends ${2:base} {\n\tconstructor (${3:arguments}) {\n\t\tsuper(${3:arguments})\n\t\t${0}\n\t}\n}",
--     },
--     {
--         name = "typeof",
--         trig = "to",
--         body = "typeof ${1:source} === '${2:undefined}'",
--     },
--     {
--         name = "instanceof",
--         trig = "iof",
--         body = "${1:source} instanceof ${2:Object}",
--     },
--     {
--         name = "constructor",
--         trig = "cn",
--         body = "constructor () {\n\t${0}\n}",
--     },
--     {
--         name = "use strict",
--         trig = "uss",
--         body = "'use strict'",
--     },
--     {
--         name = "JSON.stringify()",
--         trig = "js",
--         body = "JSON.stringify($0)",
--     },
--     {
--         name = "JSON.parse()",
--         trig = "jp",
--         body = "JSON.parse($0)",
--     },
--     {
--         name = "getter",
--         trig = "get",
--         body = "get ${1:property} () {\n\t${0}\n}",
--     },
--     {
--         name = "setter",
--         trig = "set",
--         body = "set ${1:property} (${2:value}) {\n\t${0}\n}",
--     },
--     {
--         name = "getter + setter",
--         trig = "gs",
--         body = "get ${1:property} () {\n\t${0}\n}\nset ${1:property} (${2:value}) {\n\t\n}",
--     },
--     {
--         name = "Object.assign",
--         trig = "oa",
--         body = "Object.assign(${1:dest}, ${2:source})",
--     },
--     {
--         name = "Object.create",
--         trig = "oc",
--         body = "Object.create(${1:obj})",
--     },
--     {
--         name = "Object.getOwnPropertyDescriptor",
--         trig = "og",
--         body = "Object.getOwnPropertyDescriptor(${1:obj}, '${2:prop}')",
--     },
--     {
--         name = "Object.defineProperty",
--         trig = "od",
--         body = "Object.defineProperty(${1:dest}, '${2:prop}', {\n\t${0}\n})",
--     },
--     {
--         name = "Object.keys",
--         trig = "ok",
--         body = "Object.keys(${1:obj})",
--     },
--     {
--         name = "Object.values",
--         trig = "ov",
--         body = "Object.values(${1:obj})",
--     },
--     {
--         name = "Object.entries",
--         trig = "oe",
--         body = "Object.entries(${1:obj})",
--     },
--     {
--         name = "return",
--         trig = "r",
--         body = "return ${0}",
--     },
--     {
--         name = "return arrow function",
--         trig = "rf",
--         body = "return (${1:arguments}) => ${2:statement}",
--     },
--     {
--         name = "wrap selection in arrow function",
--         trig = "wrap selection in arrow function",
--         body = "() => {\n\t{$TM_SELECTED_TEXT}\n}",
--         description = "wraps text in arrow function",
--     },
--     {
--         name = "wrap selection in async arrow function",
--         trig = "wrap selection in async arrow function",
--         body = "async () => {\n\t{$TM_SELECTED_TEXT}\n}",
--         description = "wraps text in arrow function",
--     },
--     {
--         name = "For Loop",
--         trig = "for",
--         body = [
--             "for (let ${1:index} = 0; ${1:index} < ${2:array}.length; ${1:index}++) {",
--             "\tconst ${3:element} = ${2:array}[${1:index}];",
--             "\t$0",
--             "}"
--         ],
--         description = "For Loop",
--     },
--     {
--         name = "Function Statement",
--         trig = "function",
--         body = ["function ${1:name}(${2:params}) {", "\t$0", "}"],
--         description = "Function Statement",
--     },
--     {
--         name = "New Statement",
--         trig = "new",
--         body = ["const ${1:name} = new ${2:type}(${3:arguments});$0"],
--         description = "New Statement",
--     },
--     {
--         name = "Set Timeout Function",
--         trig = "setTimeout",
--         body = ["setTimeout(() => {", "\t$0", "}, ${1:timeout});"],
--         description = "Set Timeout Function",
--     },
--     {
--         name = "Set Interval Function",
--         trig = "setInterval",
--         body = ["setInterval(() => {", "\t$0", "}, ${1:interval});"],
--         description = "Set Interval Function",
--     },
--     {
--         name = "Import external module.",
--         trig = "import statement",
--         body = ["import { $0 } from \"${1:module}\";"],
--         description = "Import external module.",
--     },
-- }

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

ls.add_snippets("javascript",  luasnip_snippets)
ls.add_snippets("vue", luasnip_snippets)
