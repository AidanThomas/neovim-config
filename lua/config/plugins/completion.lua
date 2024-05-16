local cmp = require("cmp")
local utils = require("custom.utils")

cmp.setup({
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<Tab>"] = function(fallback) fallback() end,
        ["<S-Tab>"] = function(fallback) fallback() end,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

local ls = require("luasnip")
ls.config.set_config = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

for _, ftpath in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
    loadfile(ftpath)()
end

utils.register_mappings({
    ["i"] = {
        ["<C-k>"] = { function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { desc = "Expand snippet if exists" } },
        ["<C-j>"] = { function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { desc = "Jump snippet nodes if possible" } },
    },
    ["s"] = {
        ["<C-k>"] = { function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { desc = "Expand snippet if exists" } },
        ["<C-j>"] = { function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { desc = "Jump snippet nodes if possible" } },
    }
})
