local theme = require("lualine.themes.ayu_dark")

require("lualine").setup({
	options = { theme = theme },
	extensions = { "nvim-tree" },
})
