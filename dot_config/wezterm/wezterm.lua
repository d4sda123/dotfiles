local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.color_scheme = "AyuDark (Gogh)"
config.enable_scroll_bar = false
config.disable_default_key_bindings = true
config.window_background_opacity = 0.90

config.keys = {
    { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "t", mods = "CTRL", action = act.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },
    { key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = true }) },
    { key = "UpArrow", mods = "CTRL|SHIFT", action = act.ScrollByLine(-2) },
    { key = "DownArrow", mods = "CTRL|SHIFT", action = act.ScrollByLine(2) },
}

return config
