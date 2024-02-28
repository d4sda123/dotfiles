local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer ... Close and reopen Neovim")
    vim.cmd([[packadd packer.nvim]])
end

local packer_status, packer = pcall(require, "packer")
if not packer_status then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup( function(use)

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
        use({ "nvim-tree/nvim-tree.lua" })
        use({ "nvim-telescope/telescope.nvim", tag = "0.1.5" })

        -- GUI
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
        use("xiyaowong/transparent.nvim")

        -- Other
        use("startup-nvim/startup.nvim")

    if packer_bootstrap then
        require('packer').sync()
    end
end)
