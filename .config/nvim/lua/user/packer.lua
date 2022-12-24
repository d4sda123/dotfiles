return require("packer").startup({
	function()
		-- Principal
		use("wbthomason/packer.nvim")
		use("lewis6991/impatient.nvim")
		use("nvim-lua/plenary.nvim")
		use("Shatur/neovim-ayu")
		use("dstein64/vim-startuptime")

		-- Syntax
		use("nvim-treesitter/nvim-treesitter")
		use("norcalli/nvim-colorizer.lua")
		use("lukas-reineke/indent-blankline.nvim")
		use("numToStr/Comment.nvim")
		use("windwp/nvim-autopairs")
		use("nvim-tree/nvim-web-devicons")
		use("m-demare/hlargs.nvim")

		-- GIT
		use("lewis6991/gitsigns.nvim")
		use("rlch/github-notifications.nvim")

		-- Completition
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-nvim-lsp")

		-- Snippets
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets")
		use("hrsh7th/cmp-nvim-lua")

		-- LSP
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("neovim/nvim-lspconfig")
		use("folke/trouble.nvim")
		use("jose-elias-alvarez/null-ls.nvim")

		-- File Explorer
		use({ "nvim-tree/nvim-tree.lua", tag = "nightly" })
		use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })

		-- GUI
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
		use("romgrk/barbar.nvim")
		use("MunifTanjim/nui.nvim")
		-- use("rcarriga/nvim-notify")
		use("folke/noice.nvim")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
