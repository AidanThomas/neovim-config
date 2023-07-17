return {
	-- Core
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			require("config.plugins.telescope")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufEnter *.*",
		config = function()
			require("config.plugins.treesitter")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		event = "BufEnter *.*",
		config = function()
			require("config.plugins.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufEnter *.*",
		config = function()
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

		event = "BufEnter *.*",
		config = function()
			require("config.plugins.lsp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		ft = "lua",
	},

	-- Themes
	{
		"folke/tokyonight.nvim",
		as = "tokyonight",
		priority = 1000,
	},

	-- Essential editor plugins
	{
		"windwp/nvim-autopairs",
		event = "BufEnter *.*",
		opts = require("config.plugins.autopairs")
	},
	{
		"NvChad/nvterm",
		event = "BufEnter *.*",
		config = function()
			require("config.plugins.nvterm")
		end,
	},
	{
		"unblevable/quick-scope",
		event = "BufEnter *.*",
		config = function() require("config.plugins.quickscope").setup() end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufEnter *.*",
		config = function()
			require("Comment").setup(require("config.plugins.comment"))
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("config.plugins.whichkey")
		end
	},

	-- Misc plugins
	{
		"mbbill/undotree",
		event = "BufEnter *.*"
	},
	{
		"tpope/vim-fugitive",
		event = "BufEnter *.*"
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufEnter *.*",
		config = function()
			require("config.plugins.nvimtree")
		end,
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
		"opdavies/toggle-checkbox.nvim",
		ft = "markdown",
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
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufEnter *.*",
		opts = {
			require("config.plugins.trouble")
		},
	},
}
