vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'nvim-lua/plenary.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } },
	}

	use {
		'cocopon/iceberg.vim',
		as = 'iceberg'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	}

	use 'nvim-treesitter/playground'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

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

	use 'windwp/nvim-autopairs'

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

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' }
		},
	}

	use 'NvChad/nvterm'

	use {
		'unblevable/quick-scope',
		config = function()
			require('core.config.quickscope').setup()
		end,
	}

	use 'goolord/alpha-nvim'
	use 'numToStr/Comment.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'folke/which-key.nvim'
	use {
		'stevearc/oil.nvim',
		config = function() require('oil').setup() end
	}
end)
