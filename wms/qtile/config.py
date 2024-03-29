from libqtile import bar, layout, widget, hook
import os
import subprocess
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#
# Vars
#

# a0 - active followed by priority number; 0 being highest
# b0 - block
colors = {
        "a":"#fb4934",
        "a2":"#83a598",
        "a_":"#222222",
        "bg":"#32302f",
        # "b0":"#427b58",
        # "b0":"#076678",
        "b1":"#8f3f71",
}
gap = 15


#
# Defaults & Wallpaper
#

mod = "mod4"
terminal = guess_terminal()
wallpaper = "~/dotfiles/wallpaper/Wallpaper/yourname/6.png"
default_padding  = 10

default_bg = "#222222"
primary = "#ff5563"

#
# Key mapping
#

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], 'period', lazy.next_screen(), desc='Next monitor'),
    Key([mod], "f", lazy.window.toggle_maximize(), desc="Toggle maximize"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),
    Key([mod], "c", lazy.spawn("flameshot gui"), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod,"shift"], "x", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "R", lazy.restart(), desc="Spawn a command using a prompt widget"),
    # Key([mod, "shift"], r, cmd_reload_config(), desc="")
]

#
# Workspaces
#

groups = [Group(i) for i in "123456789"]
# groups = [Group(i) for i in "123456789"]


for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
#
# Layouts
#

layouts = [
    layout.Bsp(margin=15),
    layout.Zoomy(),
    layout.MonadTall(margin=10),
    layout.MonadWide(margin=10),
    layout.Floating(),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(
    #     bg_color = default_bg,
    #     active_bg = primary,
    #     active_fg = default_bg,
    #     fontsize = 15
    # ),
    # layout.VerticalTile(),
]

#
# bar
#

widget_defaults = dict(
    font="Maple Mono NF",
    # font = "GoMono Nerd Font Mono",
    fontsize=16,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper = wallpaper,
        wallpaper_mode = "fill",
        bottom=bar.Bar(
            [
                widget.Spacer(length=gap),
                widget.TextBox(
                        fmt="",
                        foreground = colors['a'],
                        fontsize=30
                ),
                widget.CurrentLayout(padding=default_padding,),
                widget.GroupBox(
                    highlight_method="line",
                    highlight_color = [ colors['bg'], colors['bg']],
                    this_current_screen_border = colors['a'],
                    this_screen_border = colors['a_'],
                    other_current_screen_border = colors['a2'],
                    other_screen_border = colors['a_'],
                ),
                widget.Prompt(background=colors['a'],foreground=colors['bg']),
                # widget.Pomodoro(),
                widget.WindowName(foreground=colors['a2']),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Spacer(length=gap),
                widget.TextBox(
                    fmt="󰕾",
                    markup = True,
                    foreground = colors['a'],
                    fontsize=20
                ),
                widget.PulseVolume(),
                widget.Spacer(length=gap),

                widget.TextBox(
                    fmt="󰃶",
                    markup = True,
                    foreground = colors['a'],
                    fontsize=20
                ),
                widget.Clock(
                    format="%Y-%m-%d %a",
                 ),

                widget.Spacer(length=gap),

                widget.TextBox(
                    fmt="",
                    markup = True,
                    foreground = colors['a'],
                    fontsize=20
                ),
                widget.Clock(
                    format="%I:%M %p",
                 ),


                widget.Spacer(length=gap),
                # widget.BatteryIcon(scale=1),

                widget.TextBox(
                    fmt="󱊣",
                    foreground = colors['a'],
                ),
                widget.Battery(
                    # padding = default_padding,
                    format = '{percent:2.0%}',
                    discharge_char = '󰂌',
                    full_char = '󱊣',
                    charge_char = '󰂄',
                    empty_char = '󰂎',
                    show_short_text = True,
                ),

                widget.Spacer(length=gap),

                widget.TextBox(
                    fmt="󰂌",
                    foreground = colors['a'],
                ),
                widget.Battery(
                    format = '{hour:d}:{min:02d}',
                ),
                widget.Spacer(length=gap),
                widget.Systray(padding= default_padding),
                # widget.QuickExit(),
            ],
            30,
            # background = "#00000000"
            background = colors['bg']
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
    Screen(
        wallpaper = wallpaper,
        wallpaper_mode = "fill",

        bottom=bar.Bar(
            [
                widget.Spacer(length=gap),
                widget.TextBox(
                        fmt="",
                        foreground = colors['a'],
                        fontsize=30
                ),
                widget.CurrentLayout(padding=default_padding,),
                widget.GroupBox(
                    highlight_method="line",
                    highlight_color = [ colors['bg'], colors['bg']],
                    this_current_screen_border = colors['a'],
                    this_screen_border = colors['a_'],
                    other_current_screen_border = colors['a2'],
                    other_screen_border = colors['a_'],
                ),
                widget.Prompt(background=colors['a'],foreground=colors['bg']),
                # widget.Pomodoro(),
                widget.WindowName(foreground=colors['a2']),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Spacer(length=gap),
                widget.TextBox(
                    fmt="󰕾",
                    markup = True,
                    foreground = colors['a'],
                    fontsize=20
                ),
                widget.PulseVolume(),
                widget.Spacer(length=gap),

                widget.TextBox(
                    fmt="󰃶",
                    markup = True,
                    foreground = colors['a'],
                    fontsize=20
                ),
                widget.Clock(
                    format="%Y-%m-%d %a",
                 ),

                widget.Spacer(length=gap),

                widget.TextBox(
                    fmt="",
                    markup = True,
                    foreground = colors['a'],
                    fontsize=20
                ),
                widget.Clock(
                    format="%I:%M %p",
                 ),


                widget.Spacer(length=gap),
                # widget.BatteryIcon(scale=1),

                widget.TextBox(
                    fmt="󱊣",
                    foreground = colors['a'],
                ),
                widget.Battery(
                    # padding = default_padding,
                    format = '{percent:2.0%}',
                    discharge_char = '󰂌',
                    full_char = '󱊣',
                    charge_char = '󰂄',
                    empty_char = '󰂎',
                    show_short_text = True,
                ),

                widget.Spacer(length=gap),

                widget.TextBox(
                    fmt="󰂌",
                    foreground = colors['a'],
                ),
                widget.Battery(
                    format = '{hour:d}:{min:02d}',
                ),
                widget.Spacer(length=gap),
                # widget.QuickExit(),
            ],
            30,
            # background = "#00000000"
            background = colors['bg']
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


# I wrote the hook below auto minimize = True line in the default config file.
# This doesn't matter. But if you are new and confused, now you know :)

#
# Autostart
#

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/dotfiles/wms/qtile/autostart.sh')
    subprocess.Popen([home])
