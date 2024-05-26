return {
    -- Core
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.4",
        dependencies = {
            { "nvim-lua/plenary.nvim" },

            -- Extra extensions
            { "nvim-telescope/telescope-file-browser.nvim", },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = 'make',
            },
        },
        cmd = "Telescope",
        config = function()
            require("config.plugins.telescope")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.plugins.treesitter")
        end,
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        }
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
                build = function()
                    pcall(vim.cmd.MasonUpdate)
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            require("config.plugins.lsp")
        end,
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
            { "numToStr/Comment.nvim" },
            { "nvim-telescope/telescope.nvim" },
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

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-path" },
            { "onsails/lspkind.nvim" }
        },
        event = "BufEnter *.*",
        config = function()
            require("config.plugins.completion")
        end
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
        keys = { "f", "F", "t", "T" },
        config = function() require("config.plugins.quickscope").setup() end,
    },
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", nil, mode = "n" },
            { "gbc", nil, mode = "n" },
            { "gc",  nil, mode = "v" },
            { "gco", nil, mode = "n" },
            { "gcO", nil, mode = "n" },
        },
        config = function()
            require("config.plugins.comment")
        end
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
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "leoluz/nvim-dap-go" },
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },
            { "nvim-neotest/nvim-nio" },
        },
        config = function()
            require("config.plugins.nvim-dap")
        end,
    },

    -- Misc plugins
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
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for latest features
        event = "BufEnter *.*",
        config = function()
            require("config.plugins.nvim-surround")
        end
    },
    {
        "folke/trouble.nvim",
        branch = "dev",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        opts = require("config.plugins.trouble")
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter *.*",
        config = function()
            require("config.plugins.gitsigns")
        end,
    },
    {
        "folke/neodev.nvim",
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                yaml = { 'cfn_lint' }
            }
        end
    },
    {
        "gpanders/nvim-parinfer",
        ft = "yuck",
    },
}
