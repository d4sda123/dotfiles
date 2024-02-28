local colorizer_status, colorizer = pcall(require, "colorizer")
if not colorizer_status then
    return
end

colorizer.setup({
    "*"
}, {
    mode = "background",
    names = false,
    RGB = true,
    RRGGBB = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true
})
