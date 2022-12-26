require("nvim-treesitter.configs").setup({

    ensure_installed = { "lua", "html", "python", "json", "vim", "javascript" },

    highlight = {
        enable = true,
        disable = {},
    },
})
