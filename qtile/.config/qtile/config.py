import os
from qtile_extras.widget.decorations import PowerLineDecoration
from libqtile import bar
from libqtile.layout.columns import Columns
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from qtile_extras import widget

# Default apps
terminal = "kitty"
launcher = "ulauncher"
browser = "brave-browser"
file_explorer = "nautilus"

# Special keys
mod = "mod4"
kleft = "left"
kright = "right"
kdown = "down"
kup = "up"

# Colors
left_bar_colors = ["#212630", "#212630", "#212630", "#212630", "#212630", "#212630"]
# left_bar_colors = ["#e07070", "#e0a170", "#e0ce70", "#89e070", "#386b82"]
font_color = "#FFFFFF"
bg_selected = "#215578"
bar_bg = "#212630"
border_window = "#9da5b3"
right_bar_font = "#FFFFFF"
# right_bar_font = "#000000"

# Extras
powerline = {"decorations": [PowerLineDecoration(path="arrow_right")]}
wallpaper = "~/Imágenes/wallpaper.png"

# Comands to execute
autoexecute = [
    f"feh {wallpaper} --bg-scale",
    "picom -b",
    # "volumeicon &",
    "classicmenu-indicator &",
    "nm-applet &",
    "vmtoolsd -n vmusr --blockFd3 &"  # sometimes vmware clipboard doesn't work 
]

keys = [
    # Move focus
    Key([mod], kleft, lazy.layout.left(), desc = "Move focus to left"),
    Key([mod], kright, lazy.layout.right(), desc = "Move focus to right"),
    Key([mod], kdown, lazy.layout.down(), desc = "Move focus down"),
    Key([mod], kup, lazy.layout.up(), desc = "Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc = "Move window focus to other window"),

    # Move windows
    Key([mod, "shift"], kleft, lazy.layout.shuffle_left(), desc = "Move window to the left"),
    Key([mod, "shift"], kright, lazy.layout.shuffle_right(), desc = "Move window to the right",),
    Key([mod, "shift"], kdown, lazy.layout.shuffle_down(), desc = "Move window down"),
    Key([mod, "shift"], kup, lazy.layout.shuffle_up(), desc = "Move window up"),

    # Grow windows
    Key([mod, "control"], kleft, lazy.layout.grow_left(), desc = "Grow window to the left"),
    Key([mod, "control"], kright, lazy.layout.grow_right(), desc = "Grow window to the right"),
    Key([mod, "control"], kdown, lazy.layout.grow_down(), desc = "Grow window down"),
    Key([mod, "control"], kup, lazy.layout.grow_up(), desc = "Grow window up"),

    # Launch some apps
    Key([mod], "Return", lazy.spawn(terminal), desc = "Launch terminal"),
    Key([mod], "r", lazy.spawn(launcher), desc = "Launch app launcher"),
    Key([mod], "f", lazy.spawn(browser), desc = "Launch browser"),
    Key([mod], "e", lazy.spawn(file_explorer), desc = "Launch file explorer"),

    # Others
    Key([mod, "control"], "r", lazy.reload_config(), desc = "Reload the config"),
    Key([mod], "Tab", lazy.next_layout(), desc = "Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc = "Kill focused window"),
    Key([mod], "n", lazy.layout.normalize(), desc = "Reset all window sizes"),
    Key([mod, "shift"], "Return",lazy.layout.toggle_split(), desc = "Toggle between split and unsplit sides of stack"),
    Key([mod, "control"], "q", lazy.shutdown(), desc = "Shutdown Qtile"),
]

groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc = "Switch to group {}".format(i.name)),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name), desc="Move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    Columns(
        border_width = 0,
        margin = 20
    ),
    Max(
        margin = 20,
    ),
]

widget_defaults = dict(
    font = "Liberation Mono",
    fontsize = 14,
    padding = 10,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top = bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    scale = 0.7
                ),
                widget.GroupBox(
                    highlight_color = [bar_bg, bar_bg],
                    borderwidth = 5,
                    disable_drag = True,
                    highlight_method = "line",
                    # inactive = font_color,
                    padding = 5,
                ),
                widget.TaskList(
                    borderwidth = 0,
                    fontsize = 0,
                    icon_size = 22,
                    highlight_method = "none",
                    padding = 3,
                ),
                widget.Notify(),
                widget.Systray(
                    icon_size = 20,
                    padding = 5,
                ),
                widget.Spacer(length = 5, **powerline),
                widget.Pomodoro(
                    # config pomodoro
                    **powerline,
                ),
                # widget.Net(
                #     format = "{down} ↓↑ {up}",
                #     interface = "ens33",
                #     background = colors[0],
                #     foreground = bar_right_font,
                #     **powerline
                # ),
                # widget.PulseVolume(
                #     background = colors[1],
                #     foreground = bar_right_font,
                #     **powerline
                # ),
                widget.DF(
                    visible_on_warn = False,
                    background = left_bar_colors[2],
                    foreground = right_bar_font,
                    **powerline
                ),
                widget.Memory(
                    background = left_bar_colors[3],
                    foreground = right_bar_font,
                    **powerline
                ),
                widget.CPU(
                    format = "{load_percent}%",
                    background = left_bar_colors[4],
                    foreground = right_bar_font,
                    **powerline
                ),
                widget.Clock(
                    format = "%H:%M %d/%m/%Y",
                    background = left_bar_colors[5],
                    foreground = right_bar_font,
                ),
                widget.QuickExit(),
            ],
            30,
            background = bar_bg,
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = Floating(
    border_width = 0,
    float_rules = [
        *Floating.default_float_rules,
        Match(wm_class = "confirmreset"),  # gitk
        Match(wm_class = "makebranch"),  # gitk
        Match(wm_class = "maketag"),  # gitk
        Match(wm_class = "ssh-askpass"),  # ssh-askpass
        Match(title = "branchdialog"),  # gitk
        Match(title = "pinentry"),  # GPG key password entry
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"

for cmd in autoexecute:
    os.system(cmd)
