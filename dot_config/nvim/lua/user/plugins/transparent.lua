local transparent_status, transparent = pcall(require, "transparent")
if not transparent_status then
    return
end

transparent.setup({
    extra_groups = { 'NvimTreeCursorLine', 'NvimTreeWinSeparator'},
})
