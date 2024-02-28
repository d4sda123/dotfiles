local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
    return
end

local theme = require("lualine.themes.ayu_dark")

lualine.setup({
    options = {
        theme = theme,
        disabled_filetypes = { 'NvimTree' },
    },
})
