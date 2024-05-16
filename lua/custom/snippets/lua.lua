require("luasnip.session.snippet_collection").clear_snippets("lua")

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("lua", {
    s("imp", {
        t("local "), i(1, "import"), t([[ = require("]]), i(2), t([[")]])
    })
})
