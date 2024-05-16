require("luasnip.session.snippet_collection").clear_snippets("go")

local ls = require("luasnip")
local extras = require("luasnip.extras")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local rep = extras.rep

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
    s("efi", {
        i(1), t({ ", " }), i(2, "err"), t({ " := " }), i(3),
        t({ "", "if " }), rep(2), t({ " != nil {" }),
        t({ "", "    return " }), i(4), rep(2),
        t({ "", "}" })
    })
})
