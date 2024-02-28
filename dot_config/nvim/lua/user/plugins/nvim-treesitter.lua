local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
	return
end

treesitter.setup({

    ensure_installed = { "lua", "html", "python", "json", "vim", "javascript" },

    highlight = {
        enable = true,
        disable = {},
    },
})
