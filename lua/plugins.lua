return {
	-- Core
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		init = function()
			require("config.plugins.telescope")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			require("config.plugins.treesitter")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		init = function()
			require("config.plugins.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			require("config.plugins.bufferline")
		end,
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP support
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},

		init = function()
			require("config.plugins.lsp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		event = "VeryLazy",
	},

	-- Themes
	{
		"folke/tokyonight.nvim",
		as = "tokyonight",
	},

	-- Essential editor plugins
	{
		"windwp/nvim-autopairs",
		opts = require("config.plugins.autopairs")
	},
	{
		"NvChad/nvterm",
		init = function()
			require("config.plugins.nvterm")
		end,
	},
	{
		"unblevable/quick-scope",
		init = function() require("config.plugins.quickscope").setup() end,
	},
	{
		"numToStr/Comment.nvim",
		init = function()
			require("Comment").setup(require("config.plugins.comment"))
		end
	},
	{
		"folke/which-key.nvim",
		init = function()
			require("config.plugins.whichkey")
		end
	},

	-- Misc plugins
	"mbbill/undotree",
	"tpope/vim-fugitive",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			require("config.plugins.nvimtree")
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		init = function()
			require("config.plugins.alpha")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		init = function()
			require("config.plugins.indent-blankline")
		end,
	},
	{
		"opdavies/toggle-checkbox.nvim"
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for latest features
		event = "VeryLazy",
		config = function()
			require("config.plugins.nvim-surround")
		end
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			require("config.plugins.trouble")
		},
	},
}
