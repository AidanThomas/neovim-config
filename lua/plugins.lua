return {
	-- Core
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- event = "VeryLazy",
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
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("config.plugins.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		enabled = false,
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
					pcall(vim.cmd.MasonUpdate)
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" }
		},

		event = "BufAdd *.*",
		config = function()
			require("config.plugins.lsp")
		end,
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
		config = function()
			require("config.plugins.nvterm")
		end,
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
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("config.plugins.whichkey")
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
			{ "nvim-telescope/telescope-dap.nvim" },
		},
		config = function()
			require("config.plugins.nvim-dap")
		end,
	},

	-- Misc plugins
	{
		"nvim-treesitter/playground",
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		cmd = "NvimTreeToggle",
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
		cmd = "TroubleToggle",
		opts = {
			require("config.plugins.trouble")
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufEnter *.*",
		config = function()
			require("config.plugins.treesitter-context")
		end,
	},
	{
		"jakewvincent/mkdnflow.nvim",
		ft = "markdown",
		config = function()
			require("config.plugins/mkdnflow")
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
		"folke/neodev.nvim",
		config = function()
			require("config.plugins.neodev")
		end,
	},

	-- My plugins
	{
		"AidanThomas/scratchpad.nvim",
		config = function()
			require("config.plugins.scratchpad")
		end,
	}
	-- {
	-- 	dir = "/home/aidant/dev/AidanThomas/scratchpad.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("config.plugins.scratchpad")
	-- 	end,
	-- }
}
