vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Core
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } },
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup(
				require('core.config.lualine')
			)
		end
	}
	use {
		'akinsho/bufferline.nvim',
		tag = 'v3.*',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' }
		}
	}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		}
	}

	-- Themes
	use {
		"folke/tokyonight.nvim",
		as = 'tokyonight',
	}

	-- Essential editor plugins
	use 'windwp/nvim-autopairs'
	use 'NvChad/nvterm'
	use {
		'unblevable/quick-scope',
		config = function()
			require('core.config.quickscope').setup()
		end,
	}
	use 'numToStr/Comment.nvim'
	use 'folke/which-key.nvim'

	-- Misc plugins
	use 'nvim-treesitter/playground'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' }
		},
	}
	use 'goolord/alpha-nvim'
	use 'lukas-reineke/indent-blankline.nvim'
end)
