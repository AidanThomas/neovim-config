return {
    -- Core
    {
        "ibhagwan/fzf-lua",
        dependencies = { "mini.icons" },
        cmd = "FzfLua",
        config = function()
            require("config.plugins.fzflua")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.plugins.treesitter")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("config.plugins.lualine")
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = function()
                    pcall(vim.cmd.MasonUpdate)
                end,
                config = function()
                    require("config.plugins.mason")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },
        },
        opts = {
            servers = {
                lua_ls = {},
                gopls = {},
                csharp_ls = {},
                ts_ls = {},
                nil_ls = {},
                html = {
                    capabilities = function()
                        local capabilities = vim.lsp.protocol.make_client_capabilities()
                        capabilities.textDocument.completion.completionItem.snippetSupport = true
                        return capabilities
                    end
                },
                cssls = {
                    capabilities = function()
                        local capabilities = vim.lsp.protocol.make_client_capabilities()
                        capabilities.textDocument.completion.completionItem.snippetSupport = true
                        return capabilities
                    end
                }
            }
        },
        config = function(_, opts)
            require "config.plugins.lsp".setup(opts)
        end
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                dependencies = {
                    { "neovim/nvim-lspconfig" }
                },
                config = function()
                    require("config.plugins.navic")
                end
            },
            { "MunifTanjim/nui.nvim" },
        },
        config = function()
            require("config.plugins.navbuddy")
        end
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = "BufEnter *.*",
        config = function()
            require("config.plugins.conform")
        end,
    },

    -- Themes
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000,
        config = function()
            require("config.themes.tokyonight.setup")
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1001,
        config = function()
            require("config.themes.catppuccin.setup")
        end,
    },

    -- Essential editor plugins
    {
        "windwp/nvim-autopairs",
        event = "BufEnter *.*",
        opts = require("config.plugins.autopairs")
    },
    {
        "unblevable/quick-scope",
        keys = { 'f', 'F', 't', 'T' },
        config = function()
            require("config.plugins.quickscope").setup()
        end
    },
    {
        "echasnovski/mini.nvim",
        version = false,
        lazy = false,
        config = function()
            require("config.plugins.mini").register_modules({
                { "mini.ai",         { "BufEnter", "*.*" } },
                { "mini.notify",     { "BufEnter", "*.*" } },
                { "mini.bracketed",  { "BufEnter", "*.*" } },
                { "mini.hipatterns", { "BufEnter", "*.*" } },
                { "mini.move",       { "BufEnter", "*.*" } },
                { "mini.surround",   { "BufEnter", "*.*" } },
            })
        end,
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "echasnovski/mini.icons" },
        lazy = false,
        config = function()
            require("config.plugins.oil")
        end,
    },
    {
        "tpope/vim-fugitive",
        cmd = "Git"
    },
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("config.plugins.harpoon")
        end
    },

    -- Debugging
    -- {
    --     "mfussenegger/nvim-dap",
    --     dependencies = {
    --         { "leoluz/nvim-dap-go" },
    --         { "rcarriga/nvim-dap-ui" },
    --         { "theHamsta/nvim-dap-virtual-text" },
    --         { "nvim-neotest/nvim-nio" },
    --         { "Cliffback/netcoredbg-macOS-arm64.nvim" },
    --     },
    --     config = function()
    --         require("config.plugins.nvim-dap")
    --     end,
    -- },

    -- Misc plugins
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'mini.icons'
        },
        version = '*',
        opts = {
            enabled = function()
                return not vim.tbl_contains({ "TelescopePrompt" }, vim.bo.filetype)
                    and vim.bo.buftype ~= "prompt"
                    and vim.b.completion ~= false
            end,
            keymap = { preset = 'default' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = {
                menu = {
                    auto_show = true,
                    draw = {
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return kind_icon
                                end,
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            }
                        }
                    }
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = "single" }
                },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100, -- make lazydev completions top priority
                    }
                },
            },
            signature = {
                enabled = true,
                window = { border = "single" }
            }
        },
        opts_extend = { "sources.default" }
    },
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("config.plugins.alpha")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufEnter *.*",
        config = function()
            require("config.plugins.indent-blankline")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter *.*",
        config = function()
            require("config.plugins.gitsigns")
        end,
    },
    {
        "gpanders/nvim-parinfer",
        ft = "yuck",
    },
    {
        "windwp/nvim-ts-autotag",
        ft = "html",
        config = function()
            require("nvim-ts-autotag").setup({})
        end,
    },
    -- {
    --     "kristijanhusak/vim-dadbod-ui",
    --     dependencies = {
    --         { "tpope/vim-dadbod" },
    --         {
    --             "kristijanhusak/vim-dadbod-completion",
    --             ft = { "sql", "mysql", "plsql" }
    --         },
    --     },
    --     cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    --     init = function()
    --         vim.g.db_ui_use_nerd_fonts = 1
    --     end,
    -- },
}
